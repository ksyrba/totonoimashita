class Community < ApplicationRecord
  has_many :customer_communities, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :customers, through: :customer_communities
  has_many :comments, through: :posts
  has_many :favorites, through: :posts

  has_one_attached :image

  validates :community_name, :address, presence: true, uniqueness: true
  validates :area_id, presence: true
  validates :description, length: {maximum: 150 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area

  def get_image
    if image.attached?
      image
    else
      'no_image.jpeg'
    end
  end
  
  def self.search(word)
    where(["community_name like? OR address like?", "%#{word}%", "%#{word}%"])
  end

end
