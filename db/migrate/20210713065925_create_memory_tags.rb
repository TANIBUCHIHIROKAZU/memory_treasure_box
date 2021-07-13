class CreateMemoryTags < ActiveRecord::Migration[5.2]
  def change
    create_table :memory_tags do |t|
      t.references :customer
      t.string :tag_name
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
