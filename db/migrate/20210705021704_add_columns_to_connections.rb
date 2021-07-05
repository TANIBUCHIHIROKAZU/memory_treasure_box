class AddColumnsToConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
    t.integer :followed, null: false
    t.integer :follower, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    end
  end
end
