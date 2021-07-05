class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
     t.integer :customer_id, null: false
     t.integer :payment_method, null: false, default: 0
     t.integer :price, null: false
     t.integer :plan, null: false
     t.datetime "created_at", null: false
     t.datetime "updated_at", null: false
    end
  end
end
