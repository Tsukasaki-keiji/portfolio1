class Bookmark < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :blog, optional: true
  validates :user_id, uniqueness: { scope: :blog_id}
end
