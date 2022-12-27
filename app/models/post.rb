class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  
  has_many_attached :image
  
  def self.looks(word)
    @post = Post.where("name LIKE? OR introduction LIKE? OR address LIKE?","%#{word}%","%#{word}%","%#{word}%")
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
