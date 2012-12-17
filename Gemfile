source "http://rubygems.org"

# Declare your gem's dependencies in couch_blog.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec


gem 'couch_potato', github: 'bterkuile/couch_potato'
gem 'simply_stored', github: 'bterkuile/simply_stored'

group :assets do
  gem 'coffee-rails'
  gem 'sass-rails'
  gem 'bourbon'
  gem 'bootstrap-sass'
end

gem 'tinymce-rails'
gem 'haml-rails'
gem 'slim-rails'
gem 'kaminari'
gem 'paperclip'
# jquery-rails is used by the dummy application
gem "jquery-rails"
group :development do
  gem 'pry'
  gem 'thin'
  gem 'devise', '2.0.4'
  gem 'devise_simply_stored'
  #gem 'cmtool', github: 'bterkuile/cmtool'
  #gem 'cmtool', path: '~/companytools/development/rails/cmtool'
end
group :test do
  gem 'pry'
  gem 'steak'
  gem 'factory_girl_rails'
  gem 'devise', '2.0.4'
  gem 'devise_simply_stored'
end
# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'
