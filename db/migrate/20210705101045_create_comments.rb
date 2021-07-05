class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
    t.integer :customer_id, null: false
    t.integer :memory_id, null: false
    t.text :comment, null:false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
      
    end
  end
end
