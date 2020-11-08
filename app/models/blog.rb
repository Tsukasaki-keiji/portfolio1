class Blog < ApplicationRecord
  attachment :image
  validates :image, presence: true
  validates :title, presence: true
end
