class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :customer_id, null: false
      t.integer :community_id, null: false
      t.date :visit_date, null: false
      t.integer :set_number, null: false
      t.float :total_time, null: false
      t.text :impression

      t.timestamps
    end
  end
end
