class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :gardens
  has_many :statuses
  has_many :favorites
  has_many :gardens, foreign_key: 'liked_id', through: :favorites

  validates :description, length: { in: 6..100 }, allow_nil: true 
  validates :age, numericality: true, allow_nil: true
  has_one_attached :avatar
end
