class Post < ApplicationRecord
  belongs_to :author
  has_many :elements, dependent: :destroy
  has_many :rates, as: :rateable, dependent: :destroy
  has_one_attached :header_image, dependent: :destroy
  has_many :comments, dependent: :destroy
end
