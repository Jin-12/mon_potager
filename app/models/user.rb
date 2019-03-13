class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :gardens
  has_many :favorites
  has_many :statuses
  has_many :gardens, through: :favorites

  validates :description, length: { in: 6..1000 }, allow_nil: true 
  validates :age, numericality: true, allow_nil: true
end
