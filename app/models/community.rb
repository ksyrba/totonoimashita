class Community < ApplicationRecord
  has_many :customer_communities, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :customers, through: :customer_communities
  has_many :comments, through: :posts
  has_many :favorites, through: :posts
  
  validates :community_name, :area, :address, presence: true
  validates :description, length: {maximum: 150 }
  
end
