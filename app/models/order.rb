class Order < ApplicationRecord
  belongs_to :customer
  enum plan: { "無料": 0, "プラン2": 1,"プラン3": 2}
  enum payment_method: { "なし": 0, "銀行": 1,"クレジット": 2}
  enum price: { "0": 0, "1": 200000,"2": 300000}
end
