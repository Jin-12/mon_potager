FactoryBot.define do

	# factory :user do
	# 	transient do
	# 		custom_first_name { 'Friendly' }
	# 		custom_last_name { 'Test' }
	# 		custom_age { nil }
	# 		is_admin { false }
	# 		custom_password { 'password' }
	# 		custom_password_confirmation { 'password' }
	# 	end

	# 	first_name { custom_first_name }
	# 	last_name { custom_last_name }
	# 	age { custom_age }
	# 	email { Faker::Internet.email(custom_first_name) }
	# 	description { Faker::Quote.most_interesting_man_in_the_world }
	# 	password { custom_password }
	# 	password_confirmation { custom_password_confirmation }

	# 	after(:create) do |user, evaluator|
	# 		user.statuses << 'admin' if evaluator.is_admin
	# 	end
	# end

end
