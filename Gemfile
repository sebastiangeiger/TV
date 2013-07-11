source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

gem 'compass' # Used by angular

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

gem "devise"
gem "cancan"
gem "slim-rails"
gem "jbuilder"

group :assets do
  gem "anjlab-bootstrap-rails", ">= 2.3", :require => "bootstrap-rails"
end

group :development, :test do
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem 'capybara'
end

group :test do
  gem 'cucumber-rails', require: false
  gem "database_cleaner"
  gem "poltergeist"
  gem "simplecov"
  gem "selenium-webdriver"
  gem "poltergeist"
end

group :development do
  gem "pry"
  gem "launchy"
  gem "meta_request"
  gem "binding_of_caller"
  gem "quiet_assets"
end
