class CreateMemoryImages < ActiveRecord::Migration[5.2]
  def change
    create_table :memory_images do |t|
      t.references :memory, null: false
      t.string "image_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
