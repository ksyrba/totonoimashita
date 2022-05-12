class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :customer_communities, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :communities, through: :customer_communities
  
  has_one_attached :image
  
  validates :name, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: {maximum: 50 }
  
  enum sex: { man: 1, woman: 2 }
  
  def get_image
    if image.attached?
      image
    else
      'no_image_user.jpeg'
    end
  end
  
  
end
