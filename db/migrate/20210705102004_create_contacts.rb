class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|

     t.string :name, null: false
     t.string :email, null: false
     t.string :subject, null: false
     t.text :message, null: false
     t.datetime "created_at", null: false
     t.datetime "updated_at", null: false
    end
  end
end
