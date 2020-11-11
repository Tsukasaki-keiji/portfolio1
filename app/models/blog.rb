class Blog < ApplicationRecord
  attachment :image
  validates :image, presence: true
  validates :title, presence: true
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
end
