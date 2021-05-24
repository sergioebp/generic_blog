class Post < ApplicationRecord
  belongs_to :author
  has_many :elements
  has_many :rates, as: :rateable
  has_one_attached :header_image
  has_many :comments
end
