class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.text :introduction, null: false
      t.float :latitude
      t.float :longitude
      t.integer :status, null: false, default: "0"

      t.timestamps
    end
  end
end
