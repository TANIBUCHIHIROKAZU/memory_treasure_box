class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :memory

  validates :comment, presence: true
end
