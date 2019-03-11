class Product < ApplicationRecord
    has_many :harvests
    has_many :gardens, through: :harvests
    validates :name, length: { in: 3..25 }
end
