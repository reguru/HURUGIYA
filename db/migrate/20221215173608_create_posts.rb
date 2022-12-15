class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :enduser_id, null: false
      t.integer :tag_id, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.text :introduction, null: false
      t.integer :latitude, null: false
      t.integer :longitude, null: false
      t.integer :status, null: false, default: "0"

      t.timestamps
    end
  end
end
