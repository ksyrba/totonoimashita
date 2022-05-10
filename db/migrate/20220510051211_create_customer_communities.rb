class CreateCustomerCommunities < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_communities do |t|
      t.integer :customer_id, null: false
      t.integer :community_id, null: false

      t.timestamps
    end
  end
end
