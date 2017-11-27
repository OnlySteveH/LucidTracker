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

  # Edit this method so that it doesn't use test jar
  def logged_in?
    if (user_id = session[:user_id]) # User is not remembered
      @current_user = User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id]) # User is remembered
      user = User.find_by(id: user_id)
      remember_token = cookies[:remember_token]
      (@current_user = user) if user && user.remembered?(remember_token)
    end
  end
end
