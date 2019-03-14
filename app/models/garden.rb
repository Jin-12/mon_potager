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
            puts " -------------------------------"
            result << where(["adress LIKE ?","%#{search}%"])
            puts result 
            puts " ###############################"
            result << where(["name LIKE ?","%#{search}%"])
            puts result 
            puts " ###############################"
            final_result = result.map do |collection|
                collection.map { |garden| garden }
            end
            final_result.flatten.uniq
        else
            all
        end
    end
end
