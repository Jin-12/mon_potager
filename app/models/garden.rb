class Garden < ApplicationRecord
    belongs_to :user
    has_many :harvests
    has_many :products, through: :harvests
    has_many :favorites
    has_many :users, foreign_key: 'liker_id',through: :favorites
    validates :name, length: { in: 5..100 }

    has_many_attached :images
end
