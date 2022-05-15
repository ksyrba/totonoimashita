class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :community
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :visit_date, :set_number, :total_time, presence: true 
end
