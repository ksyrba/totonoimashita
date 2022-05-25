class Community < ApplicationRecord
  has_many :customer_communities, dependent: :destroy
  has_many :post_actives, dependent: :destroy
  has_many :customers, through: :customer_communities
  has_many :comments, through: :post_actives
  has_many :favorites, through: :post_actives

  has_one_attached :image

  validates :community_name, :address, presence: true, uniqueness: true
  validates :phone_number, uniqueness: true, allow_blank: true
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
    where(["community_name like(?) OR address like(?)", "%#{word}%", "%#{word}%"])
  end
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
