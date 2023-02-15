class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates :comment, presence: true
  
  def self.search(search)
    if search
      Comment.where(['comment LIKE ?', "%#{search}%"])
    else
      Comment.all
    end 
  end
end
