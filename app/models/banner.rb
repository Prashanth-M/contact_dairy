class Banner < ActiveRecord::Base
	has_attached_file :banner_image, :styles => { :large => "340x330#", :medium => "80x80#", :thumb => "70x70#" }, :url => "/banner/:id/:style/:basename.:extension",
	:path => ":rails_root/public/banner/:id/:style/:basename.:extension"
	validates_attachment_content_type :banner_image, :content_type => /\Aimage\/.*\Z/ 
	validates :banner_image, :presence => true

	def banner_image_url
		banner_image.url(:original)
	end

end
