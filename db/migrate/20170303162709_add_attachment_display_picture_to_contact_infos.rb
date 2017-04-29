class AddAttachmentDisplayPictureToContactInfos < ActiveRecord::Migration
  def self.up
    change_table :contact_infos do |t|
      t.attachment :display_picture
    end
  end

  def self.down
    remove_attachment :contact_infos, :display_picture
  end
end
