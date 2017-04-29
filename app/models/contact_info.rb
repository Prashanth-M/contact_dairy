class ContactInfo < ActiveRecord::Base
	belongs_to :community_group

	has_attached_file :display_picture, :styles => { :large => "340x330#", :medium => "80x80#", :thumb => "70x70#" }, :url => "/contact_info/:id/:style/:basename.:extension",
	:path => ":rails_root/public/contact_info/:id/:style/:basename.:extension"


	validates_attachment_content_type :display_picture, :content_type => /\Aimage\/.*\Z/ 
	# validates :display_picture, :presence => true
	# validates :first_name, :last_name, :email, :phone, :address, :presence => true

	def display_picture_url
		display_picture.url(:original)
	end


	def self.upload_csv(model_name, csv_data)
		begin
		target_model = model_name.classify.constantize
		CSV.foreach(csv_data.path, :headers => true) do |row|
			# debugger
			@client = []
			# @admin = []
			@things_not_found = []
			# if row["IDNo"].nil?
				@cls = CommunityGroup.find_by_name(row["Community Name"])
			# debugger
			# 	if @cls.nil? 
			# 		debugger
			# 		@client << row["Community Group"]
			# 	end
			# 	# @au = AdminUser.find_by_user_name(row["Admin User"])
			# 	# if @au.nil?
			# 	# 	@admin << row["Admin User"]
			# 	# end

				if @cls.present?
					@cls = CommunityGroup.find_by_name(row["Community Name"]).id
					# @au = AdminUser.find_by_user_name(row["Admin User"]).id

					ContactInfo.create!(:id => row["IdNo"], :address_type => row["AddressType"], :name => row["Name"], :address_one => row["Address1"], :address_two => row["Address2"], :address_three => row["Address3"], :area => row["Area"], :city => row["City"], :pincode => row["PINCode"], :phone => row["Phone"], :mobile_one => row["Mobile"], :mobile_two => row["Mobile 2"], :email => row["EMail"], :member_type => row["MemberType"], :committee_member => row["CommitteeMember"], :post => row["Post"], :admission_date => row["AdmissionDate"], :community_group_id => @cls )
				else
					@things_not_found << @client if @client.nil?
					# @things_not_found << @admin if  @admin.present?
					@things = @things_not_found.flatten
					return "The following data was not found #{@things}"
				end	    
			# end
			end
			rescue Exception => e
			Rails.logger.error e.message
			Rails.logger.error e.backtrace.join("\n")
		end
		return "Data uploaded successfully!"
	end
end
