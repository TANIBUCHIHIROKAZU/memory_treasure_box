class Memory < ApplicationRecord
  
  belongs_to :customer
  has_many :favorites,dependent: :destroy
	has_many :comments,dependent: :destroy
	
	validates :memory_title,presence: true
	validates :memory_detail,presence: true
	validates :status,presence: true
	
	enum status: { public: 0, follower_only: 1 },_prefix: true
	
	def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
  
end
