# frozen_string_literal: true

class Garden < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :comments
  has_many :favorites, as: :favoritable

  validates :name, length: { in: 5..150 }

  has_many_attached :images

  geocoded_by :adress
  after_validation :geocode, if: ->(obj) { obj.adress.present? && obj.adress_changed? }

  def self.search(search)
    if search
      result = []
      result << where(['adress LIKE ?', "%#{search}%"])
      result << where(['name LIKE ?', "%#{search}%"])
      result << where(['city LIKE ?', "%#{search}%"])
      result << where(['country LIKE ?', "%#{search}%"])
      result << where(['zipcode LIKE ?', "%#{search}%"])

      Product.where(['name LIKE ?', "%#{search}%"]).each do |product|
        result << Garden.where(id: product.garden_id)
      end

      final_result = result.map do |collection|
        collection.map(&:itself)
      end
      final_result.flatten.uniq
    else
      all
    end
  end
end
