class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  # geocoded_by :address
  # after_validation :geocode, if: :address_changed?

  validates :name, presence: true
  validates :address, presence: true
  #validates :tag_ids, presence: true
  
  has_many_attached :image

  def self.looks(word)
    if word
      Post.where("name LIKE? OR introduction LIKE? OR address LIKE?","%#{word}%","%#{word}%","%#{word}%")
    else
      Post.all
    end
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
