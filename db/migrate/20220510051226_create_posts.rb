class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :post_actives do |t|
      t.references :customer, foreign_key: true
      t.references :community, foreign_key: true
      t.date :visit_date, null: false
      t.integer :set_number, null: false
      t.float :total_time, null: false
      t.text :impression

      t.timestamps
    end
  end
end
