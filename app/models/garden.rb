class Garden < ApplicationRecord
    belongs_to :user
    has_many :products
    has_many :comments
    has_many :favorites, as: :favoritable

    validates :name, length: { in: 5..150 }

    has_many_attached :images

    geocoded_by :adress
    after_validation :geocode

    def self.search(search)
        if search
            result = []
            result << where(["adress LIKE ?","%#{search}%"])
            result << where(["name LIKE ?","%#{search}%"])

            Product.where(["name LIKE ?","%#{search}%"]).each do |product|
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
