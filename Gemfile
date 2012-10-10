source 'https://rubygems.org'

gem 'rabl' # must appear before 'gon'
gem 'gon'

gem 'dropbox-api'#, :git => 'git@github.com:paulwittmann/dropbox-api.git'
gem 'haml-rails'
gem 'jquery-rails'
gem 'pg'
gem 'rails', '~>3.2'
gem 'rails-backbone'
gem 'settingslogic'
gem 'yajl-ruby', :require => 'yajl'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'animation', '~> 0.1.alpha.3' # CSS3 animations plugin for compass
  gem 'coffee-rails', '~> 3.2.2'
  gem 'compass-normalize'
  gem 'compass-rails'
  gem 'execjs'
  gem 'haml_coffee_assets'
  gem 'sass-rails',   '~> 3.2.5'
  gem 'uglifier', '>= 1.2.6'
end

group :development do
  gem 'dimensions' # pure Ruby implementation to retrieve image files' dimension
  gem 'heroku'
  gem 'lograge'
  gem 'quiet_assets'
  gem 'taps' # required to dump Heroku DB
  gem 'thin'
end

group :development, :test do
  gem 'debugger', :platforms => :mri_19
  gem 'factory_girl_rails', '>=1.1.rc1'
  gem 'guard-jasmine'
  gem 'jasminerice'
  gem 'rspec-rails', '~>2.6'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl_rails', '>=1.1.rc1', :require => false
  gem 'fuubar', '~> 1.0.0'
  gem 'shoulda-matchers', '~> 1.2.0'
  gem 'simplecov', require: false
  gem 'turn', '~> 0.8.3', :require => false
end

group :production do
end
