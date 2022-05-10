class AddSexToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :sex, :integer
    add_column :customers, :birthdate, :date
    add_column :customers, :residence, :inteder
    add_column :customers, :introduction, :text
    add_column :customers, :is_deleted, :boolean, default: false, null: false
    
  end
end
