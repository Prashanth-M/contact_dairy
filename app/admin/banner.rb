ActiveAdmin.register Banner do
	action_item only: :show  do
		link_to "New Banner", action: :new # so link will only be available on show action
   end
	permit_params :banner_image
	index do
		selectable_column
		column :banner_image_url
		column :banner_image do |i|
			link_to( image_tag(i.banner_image.url(:medium)), i.banner_image.url(:medium))
		end
		actions
	end

	# filter :title
	# filter :description

	show do
		attributes_table do
			row :banner_image_url
			row :banner_image do |i|
				link_to( image_tag(i.banner_image.url(:medium)), i.banner_image.url(:medium))
			end
			row :created_at
			row :updated_at
		end 
	end


	form do |f|
  	f.inputs "Banner" do
	    f.input :banner_image, :required => true
		end
    f.actions
	end

end