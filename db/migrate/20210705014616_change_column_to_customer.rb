class ChangeColumnToCustomer < ActiveRecord::Migration[5.2]
  def up
    change_column :customers, :icon, :string
    change_column :customers, :customer_number, :string, null: false, unique: true
  end

  
  def down
    change_column :customers, :icon, :string, default: "0", null: false
    change_column :customers, :customer_number, :string, default: "0", null: false
  end
end
