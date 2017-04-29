class CreateCommunityGroups < ActiveRecord::Migration
  def change
    create_table :community_groups do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
