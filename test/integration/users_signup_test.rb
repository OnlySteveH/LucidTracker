require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'submit invalid user data' do
    get signup_path
    invalid_data = { name: '', email: '',
                     password: 'abc', password_confirmation: 'cde' }
    post signup_path, params: { user: invalid_data }
    assert_template 'users/new'
    assert_select 'li', count: 6
  end

  test 'submit valid user data' do
    get signup_path
    valid_data = { name: 'parrot', email: 'parrot@yios.com',
                   password: 'Parrot-7', password_confirmation: 'Parrot-7' }
    post signup_path, params: { user: valid_data }
    # follow_redirect!
    # assert_template 'users/show'
    # assert_select 'div.alert-success'
  end
end
