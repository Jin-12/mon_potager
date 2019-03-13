FactoryBot.define do

	factory :garden do
		transient do
			constant { false }
		end

		name { Faker::Nation.capital_city }
		user { FactoryBot.create(:user) }

		after :build do |garden, options|
			if options.constant
				garden.name = 'Kikotager'
				garden.user = FactoryBot.build(:user, constant: true)
			end
		end
	end

end
