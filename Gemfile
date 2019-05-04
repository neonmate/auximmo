source 'https://rubygems.org'

gem 'rails', '4.2.11.1'
gem 'pg', '~> 0.15'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'exception_notification'
gem 'breach-mitigation-rails'
gem 'safe_cookies'
gem 'modularity'
gem 'edge_rider'
gem 'andand'
gem 'has_defaults'
gem 'assignable_values'
gem 'will_paginate'
gem 'makandra-navy', require: 'navy'
gem 'active_type'
gem 'rest-client'
gem 'awesome_print'
gem 'puma'
gem 'unpoly-rails'

# assets
gem 'haml-rails'
gem 'bootstrap-sass'
gem 'sass-rails'
gem 'autoprefixer-rails'
gem 'coffee-rails'
gem 'therubyracer', platform: :ruby
gem 'uglifier'
gem 'compass-rails'
gem 'compass-rgbapng'

group :development do
  gem 'query_diet'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'thin'
  gem 'katapult'

  gem 'parallel_tests'
  gem 'guard-livereload', require: false
  gem 'rack-livereload'
  gem 'spring-commands-rspec'
  gem 'spring-commands-cucumber'
end

group :development, :test do
  gem 'byebug'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'spring'
end

group :test do
  gem 'database_cleaner'
  gem 'timecop'
  gem 'launchy'

  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'cucumber', '< 2' # Incompatible with Cucumber Factory
  gem 'cucumber-rails', require: false
  gem 'cucumber_factory'
  gem 'selenium-webdriver'

  gem 'rspec'
  gem 'shoulda-matchers', require: false
end

group :production do
  gem 'rails_12factor'
end

ruby '2.4.6'
