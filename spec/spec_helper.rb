# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
test_log = File.expand_path('../dummy/log/test.log', __FILE__)
File.delete(test_log) if File.exist?(test_log)
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
puts "Rails groups: #{Rails.groups.inspect}"
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl'
require 'capybara/rspec'
require 'pry'

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')
# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }
Dir[File.join(ENGINE_RAILS_ROOT, "spec/factories/**/*.rb")].each {|f| require f }

module NavigationHelpers
  # Put helper methods related to the paths in your application here.

  def homepage
    "/"
  end

  def login_user
    visit '/users/sign_in'
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user_password
    click_on 'Sign in'
  end
end

I18n.locale = :en
Devise.stretches = 1
#Capybara.javascript_driver = :webkit
RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller
  config.include NavigationHelpers,   type: :feature
  config.include EndWithMatcher
  #config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = true
  config.render_views = true

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  #config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  #config.use_transactional_fixtures = true

  config.before :each do
    CouchPotato.couchrest_database.recreate!
    @user_password = 'secret'
    @user = User.create(email: 'test@example.com', password: @user_password)
  end
  config.before :each, type: :request do
    #Capybara.current_driver = :selenium
    sign_in_user_through_request
  end
  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  #config.infer_base_class_for_anonymous_controllers = true
  def sign_in_user_through_request
    visit "/users/sign_in"
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_on 'Inloggen'
  end
end
