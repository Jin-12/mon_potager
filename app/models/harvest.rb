class Harvest < ApplicationRecord
    belongs_to :product
    belongs_to :garden
end
