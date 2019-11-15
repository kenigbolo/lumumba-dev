source 'https://rubygems.org'

gem 'rails', '6.0.1'

gem 'acts_as_votable', '~> 0.12.1' # Voteable Gem
gem 'braintree', '~> 2.100'
gem 'carmen-rails', '~> 1.0'
gem 'carrierwave', '>= 1.0.0.rc', '< 3.0' # Add carriewave gem to upload pictures to user profile
gem 'cloudinary', '~> 1.13'
gem 'coffee-rails', '~> 5.0' # Use CoffeeScript for .coffee assets and views
gem 'country_select', '~> 4.0'
gem 'devise', '~> 4.7' # Use devise gem for user authentication
gem 'figaro', '~> 1.1' # Use figaro gem for environment variables
gem 'friendly_id', '~> 5.3' # Use friendly_id for user profile urls
gem 'jquery-rails', '~> 4.3' # Use jquery as the JavaScript library
gem 'kaminari', '~> 1.1' # Gem for Rails 3+, Sinatra, and Merb Pagination
gem 'oj', '~> 3.9'
gem 'omniauth-facebook', '~> 5'
gem 'omniauth', '~> 1.9' # Use omniauth for oauth
gem 'pg', '1.1.4' # Use pg as the database for Active Record [Production Environment]
gem 'puma', '~> 4.3' # Use Puma as the app server
gem 'rails_admin', '~> 2.0' # gem for administration
gem 'rollbar', '~> 2.22'
gem 'sass-rails', '~> 6.0' # Use SCSS for stylesheets
gem 'simple_form', '~> 5.0' # Use simple form as default for forms
gem 'turbolinks', '~> 5' # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'uglifier', '~> 4' # Use Uglifier as compressor for JavaScript assets

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
  gem 'listen', '~> 3.2.0'
  gem 'rubocop'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring'
  gem 'sqlite3' # Use sqlite3 as the database for Active Record [Development Environment]
  gem 'web-console'
end

group :test do
  gem 'capybara', '~> 3.29'
  gem 'rspec-rails', '~> 3.9'
  gem 'selenium-webdriver', '~> 3.142'
  gem 'simplecov', '~> 0.17'
  gem 'webmock', '~> 3.7'
  gem "database_cleaner", '~> 1.7'
  gem "shoulda-matchers", "~> 4.1"
end
