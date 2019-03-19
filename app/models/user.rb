# frozen_string_literal: true

class User < ApplicationRecord
  after_create :welcome_send
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

  has_one_attached :avatar

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def is_admin?
    true
  end
end
