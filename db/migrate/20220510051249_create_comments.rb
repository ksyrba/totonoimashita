class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :customer, foreign_key: true
      t.references :post_active, foreign_key: true
      t.string :comment, null: false

      t.timestamps
    end
  end
end
