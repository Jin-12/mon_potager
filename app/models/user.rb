class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :gardens
  has_many :favorites, as: :favoritable
  has_many :statuses

  validates :description, length: { in: 6..1000 }, allow_nil: true 
  # validate :is_date, :is_past

  # private

  # def is_date
  #   if birthdate.is_a?(Date)
  #     errors.add(:birthdate, "Must be a Date class variable")
  #   end
  # end

  # def is_past
  #   if birthdate < Date.today
  #     errors.add(:birthdate, "Must be in the past")
  #   end
  # end
end
