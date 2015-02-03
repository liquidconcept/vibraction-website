source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.1.1'
gem 'rails-i18n', '~> 4.0.0'
gem 'turbolinks'
gem 'rails_config'

gem 'pg'

gem 'devise'

# assets
gem 'compass-rails'
gem 'sass-rails'
gem 'bootstrap-sass'
gem 'jquery-rails'

gem 'uglifier'
gem 'therubyracer', platforms: :ruby

group :deploy do
  gem 'capistrano', '3.2.1'
  gem 'capistrano-git-push'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
end

# Production environment dependencies
group :production, :staging do
end

# Development environment dependencies (also needed by test environement)
group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'redcarpet'
  gem 'yard'
  gem 'factory_girl'
end

# Dependencies should be load only in development environment
group :development do
  gem 'spring'
end

# Guard dependencies
group :guard do
  gem 'guard'

  gem 'guard-bundler'
  gem 'guard-pow'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'guard-teaspoon'

  gem 'rb-readline', platforms: :ruby
end
