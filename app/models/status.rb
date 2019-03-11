class Status < ApplicationRecord
    belongs_to :user
    validates :content, length: { in: 6..100 }
end
