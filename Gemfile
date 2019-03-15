# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.2'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

gem 'aws-sdk-s3', require: false
gem 'bootstrap'
gem 'devise'
gem 'devise-bootstrap-views', '~> 1.0'
gem 'devise-i18n'
gem 'dotenv-rails'
gem 'factory_bot_rails'
gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
gem 'font-awesome-rails'
gem 'geocoder'
gem 'gmaps4rails'
gem 'jquery-rails'
gem 'rspec-rails', '~> 3.8'
gem 'rubocop'
gem 'simple_form'
gem 'stripe'
gem 'underscore-rails'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'awesome_print'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry'
  gem 'pry-rails'
end

group :development do
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
