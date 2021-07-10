class Information < ApplicationRecord
  
  belongs_to :admin_genre
  belongs_to :admin
  
  validates :information_title, presence: true
  validates :information_detail, presence: true
  validates :admin_genre_id, presence: true
  
end
