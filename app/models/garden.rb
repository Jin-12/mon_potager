# frozen_string_literal: true

class Garden < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :comments
  has_many :favorites, as: :favoritable

  validates :name, length: { in: 5..150 }
  validates :zipcode, presence: true, format: { with: /(([0-8][0-9])|(9[0-5]))[0-9]{3}\z/ }
  has_many_attached :images

  geocoded_by :full_address
  after_validation :geocode, if: ->(obj) { obj.adress.present? && obj.adress_changed? }

  def self.search(search)
    if search
      result = []
      result << where(["adress LIKE ?", "%#{search}%"])
      result << where(["name LIKE ?", "%#{search}%"])
      result << where(["city LIKE ?", "%#{search}%"])
      result << where(["country LIKE ?", "%#{search}%"])
      result << where(["zipcode LIKE ?", "%#{search}%"])

      Product.where(["name LIKE ?", "%#{search}%"]).each do |product|
        result << Garden.where(id: product.garden_id)
      end

      final_result = result.map do |collection|
        collection.map(&:itself)
      end
      @search_result = final_result.flatten.uniq
      if @search_result.empty?
        flash[:warning] = "Pas de résultat, essayez une autre recherche"
        all
      else
        @search_result
      end
    else
      all
    end

  end



  private

  def full_address
    [adress, zipcode, city, country].compact.join(", ")
  end
end
