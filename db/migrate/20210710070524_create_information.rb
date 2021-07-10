class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
     t.integer :admin_genre_id, null: false
     t.integer :admin_id, null: false
     t.string :information_title, null: false
     t.text :information_detail, null: false
     t.datetime "created_at", null: false
     t.datetime "updated_at", null: false
    end
  end
end
