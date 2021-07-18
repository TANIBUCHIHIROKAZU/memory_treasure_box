class CreateTagmaps < ActiveRecord::Migration[5.2]
  def change
    create_table :tagmaps do |t|
      t.references :memory
      t.references :memory_tag
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
