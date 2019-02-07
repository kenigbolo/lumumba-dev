source 'https://rubygems.org'

gem 'rails', '5.0.7.1'

gem 'acts_as_votable', '~> 0.12.0' # Voteable Gem
gem 'braintree', '~> 2.68'
gem 'carmen-rails', '~> 1.0'
gem 'carrierwave', '>= 1.0.0.rc', '< 2.0' # Add carriewave gem to upload pictures to user profile
gem 'cloudinary', '~> 1.2'
gem 'coffee-rails', '~> 4.2' # Use CoffeeScript for .coffee assets and views
gem 'country_select', '~> 2.5'
gem 'devise', '~> 4.2' # Use devise gem for user authentication
gem 'figaro', '~> 1.1' # Use figaro gem for environment variables
gem 'friendly_id', '~> 5.1' # Use friendly_id for user profile urls
gem 'jquery-rails', '~> 4.2' # Use jquery as the JavaScript library
gem 'kaminari', '~> 0.17' # Gem for Rails 3+, Sinatra, and Merb Pagination
gem 'oj', '~> 2.12'
gem 'omniauth-facebook', '~> 5'
gem 'omniauth', '~> 1.9' # Use omniauth for oauth
gem 'pg', '0.18.1' # Use pg as the database for Active Record [Production Environment]
gem 'puma', '~> 3.12' # Use Puma as the app server
gem 'rails_admin', '~> 1.4' # gem for administration
gem 'rollbar', '~> 2.18'
gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets
gem 'simple_form', '~> 4.1' # Use simple form as default for forms
gem 'turbolinks', '~> 5' # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'uglifier', '~> 3' # Use Uglifier as compressor for JavaScript assets

group :production, :staging do
  gem 'rails_12factor' # NOTE: not needed in Rails 5, apparently
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem "factory_girl_rails"
  gem 'pry-rails'
end

group :development do
  gem 'letter_opener'
  gem 'listen', '~> 3.0.5'
  gem 'rubocop'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring'
  gem 'sqlite3' # Use sqlite3 as the database for Active Record [Development Environment]
  gem 'web-console'
end

group :test do
  gem 'capybara', '~> 3.13'
  gem 'rspec-rails', '~> 3.5'
  gem 'selenium-webdriver', '~> 3.141'
  gem 'simplecov', '~> 0.16'
  gem 'webmock', '~> 2.1'
  gem "database_cleaner", '~> 1.7'
  gem "shoulda-matchers", "~> 3.1"
end
