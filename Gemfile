source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem "browser"
gem "haml"
gem 'bootstrap-sass', '~> 2.3.1.0'
gem 'simple_form'
gem 'devise'


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

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'
group :test, :development do
	gem 'debugger'
	gem "rspec-rails"
  gem "factory_girl_rails"
  gem "guard-rspec"
  gem 'rb-fsevent'
end

group :test do 
  gem "faker"
  gem "capybara"
  gem "database_cleaner"
  gem "launchy"
end
