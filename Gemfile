source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use sqlite3 as the database for Active Record [Development Environment]
gem 'sqlite3', group: :development
# Use pg as the database for Active Record [Production Environment]
gem 'pg', '0.18.1', group: :production
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use Rspec for testing
gem 'rspec-core'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

## Gem for Rails 3+, Sinatra, and Merb Pagination
gem 'will_paginate', '~> 3.1.0'
# Add carriewave gem to upload pictures to user profile
gem 'carrierwave', '>= 1.0.0.beta', '< 2.0'
gem 'cloudinary'
# Use devise gem for user authentication
gem 'devise'
# Use omniauth for oauth
gem 'omniauth'
gem 'omniauth-facebook'
# Use fiagro gem for environment variables
gem 'figaro'
# Use simple form as default for forms
gem 'simple_form'
gem 'country_select'
gem 'carmen-rails', '~> 1.0.0'
# Use friendly_id for user profile urls
gem 'friendly_id', '~> 5.1.0'
# Voteable Gem
gem 'acts_as_votable', '~> 0.10.0'
# Secure token for order_number
gem 'has_secure_token'

# Use rails_12factor gem for production environment
gem 'rails_12factor', group: :production
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.5'
  gem 'selenium-webdriver'
  gem 'capybara'
  gem "database_cleaner"
  gem "shoulda-matchers", "3.1.1"
  gem "coveralls", require: false
  gem "factory_girl_rails"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
