class MemoryTag < ApplicationRecord
  belongs_to :customer
  has_many :tagmaps, dependent: :destroy, foreign_key: 'tag_id'
  has_many :memories, through: :tagmaps
  
end
