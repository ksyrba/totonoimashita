class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :post_active
  
end
