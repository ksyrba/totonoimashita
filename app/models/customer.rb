class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :customer_communitys, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :communitys, through: :customer_communitys
  
  validates :name, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: {maximum: 50 }
  
  enum sex: { man: 1, woman: 2 }
  
end
