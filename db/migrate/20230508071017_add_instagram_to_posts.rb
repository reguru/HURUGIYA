class AddInstagramToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :instagram, :string
  end
end
