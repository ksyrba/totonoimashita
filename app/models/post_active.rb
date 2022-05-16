class PostActive < ApplicationRecord
  belongs_to :customer
  belongs_to :community
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :visit_date, :set_number, :total_time, presence: true
  
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
