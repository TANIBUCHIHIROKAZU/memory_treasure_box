class Tagmap < ApplicationRecord
  belongs_to :memory
  belongs_to :memory_tag

  validates :memory_id, presence: true
  validates :memory_tag_id, presence: true
end
