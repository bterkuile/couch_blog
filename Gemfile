source "http://rubygems.org"

# Declare your gem's dependencies in couch_blog.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

gem 'rails', '>= 4.2.1'
gem 'couch_potato', github: 'bterkuile/couch_potato'
gem 'simply_stored', github: 'bterkuile/simply_stored'

group :assets do
  gem 'coffee-rails'
  gem 'sass-rails'
  #gem 'bourbon'
  #gem 'bootstrap-sass'
  gem "jquery-rails"
  gem 'font-awesome-rails'
  gem 'foundation-rails'
  gem 'ace-rails-ap'
  gem 'pickadate-rails'
end

gem 'tinymce-rails'
gem 'slim-rails'
gem 'kaminari'
gem 'paperclip'
# jquery-rails is used by the dummy application
group :development, :test do
  gem 'pry'
  gem 'orm_adapter', github: 'bterkuile/orm_adapter'
  gem 'devise'
  gem 'cmtool', github: 'bterkuile/cmtool'
  gem 'devise_simply_stored', github: 'bterkuile/devise_simply_stored'
  gem 'spring'
  gem 'spring-commands-rspec'
end
group :development do
  gem 'puma'
  gem 'quiet_assets'
end
group :test do
  gem 'rspec-rails'
  gem 'capybara'
  #gem 'capybara-webkit'
  gem 'factory_girl_rails'
end
# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'
