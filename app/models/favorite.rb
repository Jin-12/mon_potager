# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :favoritable, polymorphic: true, dependent: :destroy
end
