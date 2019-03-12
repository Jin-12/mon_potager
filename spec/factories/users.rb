FactoryBot.define do

	factory :user do
		transient do
			fakered { false }
			# is_admin { false }
		end

		# trait :admin do
		# 	after(:create) do |user, evaluator|
		# 		FactoryBot.create(:status, content: 'admin', user: user)
		# 	end
		# end

		first_name { 'Urbain' }
		last_name { 'Test' }
		age { 22 }
		email { "#{first_name.downcase}@example.org" }
		description { 'For 3 years known as "Holy Cucumber", so big, so good' }
		password { 'password' }
		password_confirmation { 'password' }

		after :create do |user, options|
			if options.fakered
				rand_password = Faker::Internet.password(10, 20, true)
				first_name { Faker::Name.first_name }
				last_name { Faker::Name.last_name }
				age { 18 + rand(0, 100) }
				email { Faker::Internet.safe_email(first_name) }
				description { Faker::Quote.most_interesting_man_in_the_world }
				password { rand_password }
				password_confirmation { rand_password }
			end
		end
	end

end
