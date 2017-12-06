if ENV['CHINA']
  source 'https://mirrors.ustc.edu.cn/rubygems/'
else
  source 'https://rubygems.org'
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1', '>= 5.1.4'

# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.4.10'

gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 4.0', '>= 4.0.1'

gem 'webpacker', '~> 3.0', '>= 3.0.2'

#
gem 'connection_pool', '~> 2.2', '>= 2.2.1'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0', '>= 4.0.1'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', '~> 1.0', '>= 1.0.2'

# User system
gem 'devise', '~> 4.3'
gem 'devise-encryptable', '~> 0.2.0'

# API
gem 'active_model_serializers', '~> 0.10.6'

# json web token ruby
gem 'jwt', '~> 2.1'

# Read dotenv environment variables
gem 'dotenv-rails', '~> 2.2', '>= 2.2.1'

# Authorization
gem 'pundit', '~> 1.1.0'

# Paginator
gem 'kaminari', '~> 1.1', '>= 1.1.1'

# Ruby library for reading and writing zip file
gem 'rubyzip', '~> 1.2.0'

# spreadsheet handling tool
gem 'roo', '~> 2.5'

gem 'sidekiq'
gem 'sidekiq-cron'

# Zero MQ driver - higher version (2.0.5) is not compatible with our ZeroMq library, and the job
#                  always fails when closing the context.
gem 'ffi-rzmq', '2.0.4'

# A simple HTTP and REST client
gem 'rest-client', '~> 2.0', '>= 2.0.2'

# JSON Library
gem 'multi_json', '~> 1.12', '>= 1.12.1'

gem 'pry', '~> 0.11.3'

gem 'faker'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.16', '>= 2.16.1'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.6'
  gem "factory_bot_rails"
  gem 'database_cleaner', '~> 1.5.3'

  # Annotate models
  gem 'annotate', '~> 2.7.1'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '~> 3.5', '>= 3.5.1'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Better Errors
  gem 'better_errors', '~> 2.4'
  # A Ruby code quality reporter
  gem 'rubycritic', '~> 3.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
