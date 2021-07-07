class AddColumnsToConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
    t.integer :followed_id, null: false
    t.integer :follower_id, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    end
  end
end
