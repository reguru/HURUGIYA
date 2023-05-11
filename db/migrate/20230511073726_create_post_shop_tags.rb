class CreatePostShopTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_shop_tags do |t|
      t.references :post, null: false, foreign_key: true
      t.references :shop_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
