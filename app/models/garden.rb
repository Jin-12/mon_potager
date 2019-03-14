class Garden < ApplicationRecord
    belongs_to :user
    has_many :products
    has_many :comments
    has_many :favorites, as: :favoritable

    validates :name, length: { in: 5..150 }

    has_many_attached :images

    geocoded_by :adress
    after_validation :geocode
end
