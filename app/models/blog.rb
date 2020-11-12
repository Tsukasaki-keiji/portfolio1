class Blog < ApplicationRecord
  belongs_to :user
  attachment :image
  validates :image, presence: true
  validates :title, :body, presence: true
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
end
