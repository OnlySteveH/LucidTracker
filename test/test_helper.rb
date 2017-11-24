require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include SessionsHelper
end

class ActionDispatch::IntegrationTest
  def login_as(user, password: 'Password', remember: '0')
    post login_path, params: { session: { email: user.email,
                                          password: password,
                                          remember: remember } }
  end
end
