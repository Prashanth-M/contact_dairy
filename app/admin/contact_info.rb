ActiveAdmin.register ContactInfo  do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :address_type, :address_one, :address_two, :address_three, :area, :city, :pincode, :mobile_one, :mobile_two, :email, :member_type, :phone, :display_picture, :spouse_name, :committee_member, :post, :admission_date, :community_group_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	action_item only: :show  do
		link_to "New ContactInfo", action: :new # so link will only be available on show action
    end

	index do
		selectable_column
		column :id
		column :address_type
		column :name
		column :address_one
		column :address_two
		column :address_three
		column :area
		column :city
		column :pincode
		column :phone
		column :mobile_one
		column :mobile_two
		column :email
		column :member_type
		column :spouse_name
		column :committee_member
		column :post      
		column :admission_date
	    column :community_group
		# column :display_picture_url

		actions
	end

	# filter :email 
	# filter :name
	# filter :mobile_one


	show do |c|
		attributes_table do
			row :id
			row :address_type
			row :name
			row :address_one
			row :address_two
			row :address_three
			row :area
			row :city
			row :pincode
			row :phone
			row :mobile_one
			row :mobile_two
			row :email
			row :member_type
			row :spouse_name
			row :committee_member
			row :post      
			row :admission_date
		    row :community_group

			row :display_picture do |i|
				link_to( image_tag(i.display_picture.url(:medium)), i.display_picture.url(:medium))
			end

			row :created_at
			row :updated_at
		end
	end





	form do |f|
		f.inputs "User" do
			f.input :address_type
			f.input :name
			f.input :address_one
			f.input :address_two
			f.input :address_three
			f.input :area
			f.input :city
			f.input :pincode
			f.input :phone
			f.input :mobile_one
			f.input :mobile_two
			f.input :email
			f.input :member_type
			f.input :spouse_name
			f.input :committee_member
			f.input :post      
			f.input :admission_date
			f.input :display_picture
			f.input :community_group
		end
		f.actions
	end

	csv do
		column :id
		column :address_type
		column :name
		column :address_one
		column :address_two
		column :address_three
		column :area
		column :city
		column :pincode
		column :phone
		column :mobile_one
		column :mobile_two
		column :email
		column :member_type
		column :spouse_name
		column :committee_member
		column :post      
		column :admission_date
	    column(:community_group) {|c| c.community_group.name }

		# column(:project) { |p| p.project.title}
	 #    column(:client) { |c| c.client.email }
  #       column(:admin_user) {|a| a.admin_user.user_name}
	end


	action_item :only => :index do
		link_to 'Upload CSV', :action => 'upload_csv'
	end

	collection_action :upload_csv do
		render "admin/csv/upload_csv"
	end

	collection_action :import_csv, :method => :post do
		upload_content = ContactInfo.upload_csv("ContactInfo", params[:dump][:file])
		# debugger
		redirect_to admin_contact_infos_path, :notice => "#{upload_content}"
	end

end
