source "http://rubygems.org"

# Declare your gem's dependencies in couch_blog.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem "jquery-rails"

gem 'couch_potato', :git => 'git://github.com/bterkuile/couch_potato.git'
gem 'simply_stored', :git => 'git://github.com/bterkuile/simply_stored.git'
gem 'haml-rails'
gem 'coffee-rails'
gem 'sass-rails'
gem 'tinymce-rails'
gem 'kaminari'
gem 'bourbon'
group :development do
  gem 'pry'
  gem 'thin'
  gem 'devise', '2.0.4'
  gem 'devise_simply_stored'
end
group :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'devise', '2.0.4'
  gem 'devise_simply_stored'
  gem 'capybara'
end
# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'
