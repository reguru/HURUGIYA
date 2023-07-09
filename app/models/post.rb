class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :post_shop_tags, dependent: :destroy
  has_many :shop_tags, through: :post_shop_tags, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  FILE_NUMBER_LIMIT = 10

  validates :name, presence: true
  validates :address, presence: true
  validate :validate_files
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

  private

  def validate_files
    return if image.length <= FILE_NUMBER_LIMIT
    errors.add(:image, "を添付できる枚数は#{FILE_NUMBER_LIMIT}枚までです。")
  end

end
