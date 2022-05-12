class CreateCommunities < ActiveRecord::Migration[6.1]
  def change
    create_table :communities do |t|
      t.string :community_name, null: false, unique: true
      t.integer :area_id, null: false
      t.string :address, null: false, unique: true
      t.text :description
      t.integer :owner_id, null: false

      t.timestamps
    end
  end
end
