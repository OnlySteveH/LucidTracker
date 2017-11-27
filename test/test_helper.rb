require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
end

class ActionDispatch::IntegrationTest
  # Get ActionDispatch::Cookies::CookieJar because Rack::Test::CookieJar
  # doesn't support signed cookies
  def cookies
    cookies = ActionDispatch::Request.new(Rails.application.env_config).cookie_jar
  end

  include SessionsHelper

  def login_as(user, password: 'Password', remember: '0')
    post login_path, params: { session: { email: user.email,
                                          password: password,
                                          remember: remember } }

    # Set cookies manually
    return if remember == '0'
    user = assigns(:user)
    return if user.remember_token.nil?
    cookies[:remember_token] = user.remember_token
    cookies.signed[:user_id] = user.id
  end
end
