class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one :user_profile, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :comments
  has_many :bookmarks, dependent: :destroy
  attachment :profile_image
  
  
  validates :introduction, length: { maximum:50 }
end
