source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'simple_form'
gem 'devise'
gem 'devise-i18n'
gem 'devise-bootstrap-views', '~> 1.0'
gem 'dotenv-rails'
gem 'stripe'
gem "aws-sdk-s3", require: false
gem 'jquery-rails'
gem 'font-awesome-rails'
gem 'bootstrap'
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
gem 'underscore-rails'
gem 'geocoder'
gem 'gmaps4rails'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  gem 'awesome_print'
  gem 'pry'
  gem 'pry-rails'

end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'letter_opener'
end

group :test do
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
