class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :community
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
