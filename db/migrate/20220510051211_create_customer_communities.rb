class CreateCustomerCommunities < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_communities do |t|
      t.references :customer, foreign_key: true
      t.references :community, foreign_key: true

      t.timestamps
    end
  end
end
