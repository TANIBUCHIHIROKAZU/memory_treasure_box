class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :memories,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :orders,dependent: :destroy
  has_many :connections
  has_many :followings, through: :connections, source: :follow
  has_many :reverse_of_connections, class_name: 'Connection', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_connections, source: :customer
  has_many :memory_tags, dependent: :destroy

  attachment :icon

  validates :name,presence: true
  validates :email,presence: true
  validates :encrypted_password,presence: true
  validates :customer_number, uniqueness: true, presence: true,format: {with: /\A[a-zA-Z0-9]+\z/}

  enum plan: { "無料": 0, "プラン2": 1,"プラン3": 2}
  enum is_active: { "入会済み": true, "退会": false }

  def follow(other_customer_id)
    unless self == other_customer_id
      self.connections.find_or_create_by(follow_id: other_customer_id)
    end
  end

  def unfollow(other_customer_id)
    connection = self.connections.find_by(follow_id: other_customer_id)
    connection.destroy if connection
  end

  def following?(other_customer)
    self.followings.include?(other_customer)
  end

  def mutual_follow
    followings & followers
  end

  def follow_only
    followings.where.not(id: self.followers.ids)
  end

  def follower
    followers.where.not(id: self.followings.ids)
  end

  def mutual_follo?(other_customer)
    followings.include?(other_customer) & followers.include?(other_customer)
  end

  def active_for_authentication?
    super && (self.is_active == "入会済み")
  end

end
