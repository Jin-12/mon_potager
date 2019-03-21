# frozen_string_literal: true

class User < ApplicationRecord
  after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :gardens
  has_many :favorites
  has_many :statuses

  validates :first_name, presence: true
  validates :last_name, presence: true

  # For the time being, every user is admin...
  # TODO: seed an admin
  def is_admin?
    self.id.between?(1, 6)
  end

  private

  has_one_attached :avatar

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
