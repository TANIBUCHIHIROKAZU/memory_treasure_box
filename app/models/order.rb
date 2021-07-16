class Order < ApplicationRecord
  belongs_to :customer
  
  validates :plan,presence: true
  validates :payment_method,presence: true
  validates :price,presence: true
  validates :customer_id,presence: true
  
  enum plan: { "free_plan": 0, "plan_1": 1,"plan_2": 2}
  enum payment_method: { "brank": 0, "bank": 1,"credit": 2}
  enum price: { "free_price": 0, "200000": 1,"300000": 2}
  
  
end
