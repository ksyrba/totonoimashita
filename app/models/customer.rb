class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :customer_communities, dependent: :destroy
  has_many :post_actives, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :communities, through: :customer_communities

  has_one_attached :image

  validates :name, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: {maximum: 50 }

  enum sex: { man: 1, woman: 2 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area

  def get_image
    if image.attached?
      image
    else
      'no_image_user.jpeg'
    end
  end
  
  def age
    (Date.today.strftime('%Y%m%d').to_i - birthdate.strftime('%Y%m%d').to_i) / 10000
  end
  
  def total_set_number
    post_actives.sum(:set_number)
  end

  def all_total_time
    post_actives.sum(:total_time)
  end
end
