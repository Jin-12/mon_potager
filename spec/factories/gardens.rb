FactoryBot.define do

	factory :garden do
		transient do
			constant { false }
		end

		name { Faker::Nation.capital_city }
		user { FactoryBot.create(:user) }
		latitude { Faker::Address.latitude.to_f }
		longitude { Faker::Address.longitude.to_f }

		after :build do |garden, options|
			if options.constant
				garden.name = 'Kikotager'
				garden.user = FactoryBot.build(:user, constant: true)
				garden.latitude = '0'.to_f
				garden.longitude = 0.0
			end
		end
	end

end
