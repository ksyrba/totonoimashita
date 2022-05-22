class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :post_active
  
  validates :comment, presence: true
end
