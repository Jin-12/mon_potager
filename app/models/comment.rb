# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :garden
  belongs_to :user
end
