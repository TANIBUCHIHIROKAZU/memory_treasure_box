class MemoryImage < ApplicationRecord
  belongs_to :memory
  attachment :image, content_type: ["image/jpeg", "image/png"]
end
