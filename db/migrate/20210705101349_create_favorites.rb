class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
     t.integer :customer_id, null: false
     t.integer :memory_id, null: false
     t.datetime "created_at", null: false
     t.datetime "updated_at", null: false
    end
  end
end
