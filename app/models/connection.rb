class Connection < ApplicationRecord
  belongs_to :customer
  belongs_to :follow, class_name: "Customer"
  
  validates :customer_id, presence: true
  validates :follow_id, presence: true
end
