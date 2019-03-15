# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    transient do
      constant { false }
      empty_profile { false }
    end

    rand_password = Faker::Internet.password(10, 20, true)
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthdate { rand(Date.new(1900, 1, 1)..Date.today) }
    email { Faker::Internet.unique.safe_email(first_name) }
    description { Faker::Quote.most_interesting_man_in_the_world }
    password { rand_password }
    password_confirmation { rand_password }

    after :build do |user, options|
      if options.constant
        user.first_name = 'Urbain'
        user.last_name = 'Test'
        user.birthdate = Date.new(1997, 3, 13)
        user.email = "#{user.first_name.downcase}@example.org"
        user.description = 'For 3 years known as "Holy Cucumber", so big, so good'
        user.password = 'password'
        user.password_confirmation = 'password'
      end
    end

    after :create do |user, options|
      if options.empty_profile
        rand_password = Faker::Internet.password(10, 20, true)
        user.email { Faker::Internet.unique.safe_email(user.first_name) }
        user.first_name = nil
        user.last_name = nil
        user.birthdate = nil
        user.description = nil
        user.password { rand_password }
        user.password_confirmation { rand_password }
      end
    end
  end
end
