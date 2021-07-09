class AddColumnsToConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
    t.references :customer, foreign_key: true
    t.references :follow, foreign_key: { to_table: :customers }
    t.index [:customer_id, :follow_id], unique: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    end
  end
end
