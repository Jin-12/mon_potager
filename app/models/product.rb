class Product < ApplicationRecord
    belongs_to :garden

    validates :name, length: { in: 3..50 }
end
