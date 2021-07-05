class CreateMemories < ActiveRecord::Migration[5.2]
  def change
    create_table :memories do |t|
      t.integer "customer_id", null: false
      t.string "memory_title", null: false
      t.text "memory_detail", null: false
      t.boolean "is_display", default: true, null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
