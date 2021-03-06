# frozen_string_literal: true

class Status < ApplicationRecord
  belongs_to :user

  validates :content, length: { in: 6..1000 }
end
