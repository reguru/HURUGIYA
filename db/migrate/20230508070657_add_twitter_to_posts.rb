class AddTwitterToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :twitter, :string
  end
end
