# frozen_string_literal: true

class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.belongs_to :user, index: true
      t.references :favoritable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
