# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
#require 'spec_helper'
#require File.expand_path("../../config/environment", __FILE__)
test_log = File.expand_path('../dummy/log/test.log', __FILE__)
File.delete(test_log) if File.exist?(test_log)
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
puts "Rails groups: #{Rails.groups.inspect}"
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')
# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }
Dir[File.join(ENGINE_RAILS_ROOT, "spec/factories/**/*.rb")].each {|f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
#ActiveRecord::Migration.maintain_test_schema!
module NavigationHelpers
  # Put helper methods related to the paths in your application here.

  def homepage
    "/"
  end

  def login_user
    visit '/users/sign_in'
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user_password
    click_on 'Log in'
  end

  def sign_in_user_through_request
    visit "/users/sign_in"
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_on 'Inloggen'
  end
end

I18n.locale = :en
Devise.stretches = 1

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  #config.mock_with :rspec
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller
  config.include NavigationHelpers,   type: :feature
  config.include EndWithMatcher
  #config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = true
  config.render_views = true

  config.before :each do
    CouchPotato.couchrest_database.recreate!
    @user_password = 'secret'
    @user = User.create(email: 'test@example.com', password: @user_password)
  end
  config.before :each, type: :request do
    #Capybara.current_driver = :selenium
    sign_in_user_through_request
  end

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  #config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!
end
