class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
     t.string :news_title, null: false
     t.text :news_detail, null: false
     t.datetime "created_at", null: false
     t.datetime "updated_at", null: false
    end
  end
end
