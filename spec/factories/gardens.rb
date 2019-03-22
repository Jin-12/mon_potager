# frozen_string_literal: true

FactoryBot.define do
  factory :garden do
    transient do
      constant { false }
    end

    name { Faker::Nation.capital_city }
    user { User.all.sample }
    latitude { Faker::Address.latitude.to_f }
    longitude { Faker::Address.longitude.to_f }
    zipcode = nil
    zipcode { while !Geocoder.search(zipcode).select { |location| location.country.include?("France") }.first do zipcode = Faker::Address.zip_code end; zipcode }

    after :build do |garden, options|
      if options.constant
        garden.name = 'Kikotager'
        garden.user = FactoryBot.build(:user, constant: true)
        garden.latitude = '0'.to_f
        garden.longitude = 0.0
        garden.zipcode = '75001'
      end
    end
  end
end
