class Order < ApplicationRecord
  belongs_to :customer
  enum plan: { "無料": 0, "プラン2": 2,"プラン3": 3}
end
