class Rate < ApplicationRecord
  validates :value, :presence => true, :numericality => { :only_integer => true, :less_than_or_equal_to => 10, :greater_than_or_equal_to => 0 }

  belongs_to :rateable, polymorphic: true
  belongs_to :author
end
