class CreateContactInfos < ActiveRecord::Migration
  def change
    create_table :contact_infos do |t|
      t.string :address_type
      t.string :name
      t.string :address_one
      t.string :address_two
      t.string :address_three
      t.string :area
      t.string :city
      t.integer :pincode
      t.string :phone
      t.integer :mobile_one, limit: 8
      t.integer :mobile_two, limit: 8
      t.string :email
      t.string :member_type
      t.string :spouse_name
      t.boolean :committee_member
      t.boolean :post      
      t.date :admission_date
      t.references :community_group, index: true, foreign_key: true
  
      t.timestamps null: false
    end
  end
end
