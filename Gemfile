source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.1.1'
gem 'turbolinks'
gem 'rails_config'

gem 'pg'

# assets
gem 'compass-rails'
gem 'sass-rails'
gem 'bootstrap-sass'
gem 'jquery-rails'

gem 'uglifier'
gem 'therubyracer', platforms: :ruby

group :deploy do
  gem 'capistrano'
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
  gem 'pry-rails'
  gem 'pry-remote'
  gem 'pry-debugger'
  gem 'hirb-unicode'

  gem 'redcarpet'
  gem 'yard'
end

# Dependencies should be load only in development environment
group :development do
  gem 'spring'
end

