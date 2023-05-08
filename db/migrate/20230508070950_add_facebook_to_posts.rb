class AddFacebookToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :facebook, :string
  end
end
