require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
  end

  test 'submit invalid user data' do
    get signup_path
    invalid_data = { name: '', email: '',
                     password: 'abc', password_confirmation: 'cde' }
    assert_no_difference 'User.count' do
      post signup_path, params: { user: invalid_data }
    end
    assert_template 'users/new'
    assert_select 'li', count: 6
  end

  test 'submit valid user data' do
    get signup_path
    valid_data = { name: 'parrot', email: 'parrot@yios.com',
                   password: 'Parrot-7', password_confirmation: 'Parrot-7' }
    post signup_path, params: { user: valid_data }
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?
    # Try to log in before activation
    login_as user, password: valid_data[:password]
    assert_not logged_in?
    # Invalid activation token
    get edit_account_activation_path('invalid token', email: user.email)
    assert_not logged_in?
    # Valid token, invalid email
    get edit_account_activation_path(user.activation_token, email: 'invalid')
    assert_not logged_in?
    # Valid activation
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template 'users/show'
    assert logged_in?
  end
end
