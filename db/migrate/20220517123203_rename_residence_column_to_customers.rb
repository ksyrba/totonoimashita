class RenameResidenceColumnToCustomers < ActiveRecord::Migration[6.1]
  def change
    rename_column :customers, :residence, :area_id
  end
end
