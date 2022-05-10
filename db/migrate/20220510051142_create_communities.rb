class CreateCommunities < ActiveRecord::Migration[6.1]
  def change
    create_table :communities do |t|
      t.string :community_name, null: false
      t.integer :area, null: false
      t.string :address, null: false
　　　t.text :description

      t.timestamps
    end
  end
end
