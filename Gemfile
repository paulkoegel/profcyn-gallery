source 'https://rubygems.org'

gem 'rails', '~>3.2'

gem 'unicorn'
gem 'jquery-rails'
gem 'haml-rails'

gem 'ember-rails'
gem 'rabl' # must appear before 'gon'
gem 'gon'
gem 'yajl-ruby', :require => "yajl"

gem 'dropbox-api'
gem 'settingslogic'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'uglifier', '>= 1.0.3'
  gem 'compass-rails'
  gem 'compass-normalize'
end

group :production do
  gem 'pg'
end

group :development do
  gem 'mysql2'
  gem 'dimensions' # pure Ruby implementation to retrieve image files' dimension
  gem 'heroku'
  gem 'taps' # required to dump Heroku DB
end

group :development, :test do
  gem 'rspec-rails', '~>2.6'
  gem 'factory_girl_rails', '>=1.1.rc1'
  # gem 'ruby-debug19'
end

group :test do
  gem 'shoulda-matchers', :git => 'git://github.com/thoughtbot/shoulda-matchers.git'
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'webmock'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
