if ENV['USE_OFFICIAL_GEM_SOURCE']
  source 'https://rubygems.org'
else
  source 'https://gems.ruby-china.org'
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1', '>= 5.1.1'

# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.4.6'

gem 'puma', '~> 3.8', '>= 3.8.2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

gem 'webpacker', '~> 2.0'

gem 'foreman', '~> 0.84.0'

#
gem 'connection_pool', '~> 2.2', '>= 2.2.1'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.3', '>= 3.3.2'
gem 'redis-namespace', '~> 1.5', '>= 1.5.2'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', '~> 0.4.1'

# User system
gem 'devise', '~> 4.3'
gem 'devise-encryptable', '~> 0.2.0'

# API
gem 'active_model_serializers', '~> 0.10.6'

# json web token ruby
gem 'jwt', '~> 1.5', '>= 1.5.6'

# Read dotenv environment variables
gem 'dotenv-rails'

# Authorization
gem 'pundit', '~> 1.1.0'

# Paginator
gem 'kaminari', '~> 0.17.0'

# Ruby library for reading and writing zip file
gem 'rubyzip', '~> 1.2.0'

# spreadsheet handling tool
gem 'roo', '~> 2.5'

# Background processing
gem 'sidekiq', '~> 4.2.7'

# Zero MQ driver - higher version (2.0.5) is not compatible with our ZeroMq library, and the job
#                  always fails when closing the context.
gem 'ffi-rzmq', '2.0.4'

# Http
gem 'faraday', '~> 0.10.1'

# JSON Library
gem 'multi_json', '~> 1.12', '>= 1.12.1'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'pry', '~> 0.10.4'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.6'
  gem 'factory_girl_rails', '~> 4.8'
  gem 'database_cleaner', '~> 1.5.3'

  # Annotate models
  gem 'annotate', '~> 2.7.1'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Better Errors
  gem 'better_errors', '~> 2.1', '>= 2.1.1'
  # A Ruby code quality reporter
  gem 'rubycritic', '~> 3.2', '>= 3.2.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', '~> 1.2.2', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
