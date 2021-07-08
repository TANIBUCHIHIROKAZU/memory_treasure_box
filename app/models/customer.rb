class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :memories,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :comments,dependent: :destroy
  
  validates :name,presence: true
  validates :email,presence: true
  validates :name,presence: true
  validates :customer_number, uniqueness: true, presence: true,format: {with: /\A[a-zA-Z0-9]+\z/}
end
