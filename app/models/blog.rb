class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  attachment :image
  validates :image, presence: true
  validates :title, :body, presence: true
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
  
  
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end  
end
