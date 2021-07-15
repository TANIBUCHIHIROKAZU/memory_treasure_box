class Memory < ApplicationRecord

  belongs_to :customer
  has_many :favorites,dependent: :destroy
	has_many :comments,dependent: :destroy
	has_many :memory_images, dependent: :destroy
  has_many :tagmaps,dependent: :destroy
  has_many :memory_tags,through: :tagmaps

	accepts_attachments_for :memory_images, attachment: :image
	validates :memory_title,presence: true
	validates :memory_detail,presence: true
	validates :status,presence: true
	validate :validate_memory_images, if: :free_plan?


def free_plan?

	 if Customer.find(customer_id).orders.count > 0
	   Customer.find(customer_id).orders.last.plan == "free_plan"
	 else
	   true
	 end
end

  # before_save :aaa

  # def aaa
  #   if customer.plan_before_type_cast == 0
  #     memory_images.delete_all
  #   end
  # end

  def validate_memory_images
    if memory_images.size > 0
      errors.add(:base, 'ああああ')
    end
  end

	enum status: { public: 0, follower_only: 1 },_prefix: true

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  def save_memory_tag(sent_memory_tags,customer)
    if customer.plan == 1
      current_memory_tags = self.memory_tags.pluck(:tag_name) unless self.memory_tags.nil?
      old_memory_tags = current_memory_tags - sent_memory_tags
      new_memory_tags = sent_memory_tags - current_memory_tags

      old_memory_tags.each do |old|
        self.memory_tags.delete MemoryTag.find_by(tag_name: old)
      end
      new_memory_tags.each do |new|
        new_memory_tag = MemoryTag.find_or_create_by(tag_name: new,customer_id: customer.id)
        self.memory_tags << new_memory_tag
      end
    end
  end

end
