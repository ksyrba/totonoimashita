class PostActive < ApplicationRecord
  belongs_to :customer
  belongs_to :community
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :visit_date, :set_number, :total_time, presence: true
  
  scope :visited_this_month, -> { where(visit_date: 1.month.ago.beginning_of_day..Time.zone.now.end_of_day) }
  scope :visited_this_year, -> { where(visit_date: 1.year.ago.beginning_of_day..Time.zone.now.end_of_day) }
  
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
