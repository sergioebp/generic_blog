class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :post
  has_many :rates, as: :rateable
end
