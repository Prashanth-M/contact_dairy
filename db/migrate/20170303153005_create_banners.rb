class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.attachment :banner_image
      t.timestamps null: false
    end
  end
end
