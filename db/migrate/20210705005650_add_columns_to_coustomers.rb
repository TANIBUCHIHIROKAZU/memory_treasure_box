class AddColumnsToCoustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :is_active, :boolean, default: true, null: false
    add_column :customers, :customer_number, :string, null: false, default: '', unique: true
    add_column :customers, :icon, :string
    add_column :customers, :plan, :integer, default: 0, null: false
  end
end
