class CreateShopTags < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_tags do |t|
      t.string :name, null: 

      t.timestamps
    end
  end
end
