class Item < ApplicationRecord
  
  belongs_to :genre, optional: true
  attachment :image
  validates :name, presence: true
  
  def save_genres(genre_ids)
    genre_ids.each do |genre_id|
      item_genre = Genre.find_by(id: genre_id)
      self.genres << item_genre
    end
  end  
end
