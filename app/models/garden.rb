class Garden < ApplicationRecord
    belongs_to :user
    has_many :products
    has_many :comments
    has_many :favorites, as: :favoritable

    validate :name, length: { in: 5..150 }
end
