# frozen_string_literal: true

class CreateGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :adress
      t.string :city
      t.string :zipcode
      t.string :country
      t.timestamps
    end
  end
end
