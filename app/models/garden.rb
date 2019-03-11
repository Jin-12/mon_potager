class Garden < ApplicationRecord
    belongs_to :user
    has_many :harvests
    has_many :products, through: :harvests
    has_many :favorites
    has_many :users, through: :favorites

    has_many_attached :images
end
