class Product < ApplicationRecord
    has_many :harvests
    has_many :gardens, through: :harvests
end
