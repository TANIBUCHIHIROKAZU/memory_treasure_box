class AdminGenre < ApplicationRecord
  has_many :news
  
  validates :name,presence: true
end
