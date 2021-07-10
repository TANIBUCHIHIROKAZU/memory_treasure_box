class AdminGenre < ApplicationRecord
  has_many :informations
  
  validates :name,presence: true, uniqueness: true
end
