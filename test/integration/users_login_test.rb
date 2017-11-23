require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:testuser)
  end

  test 'successful login' do
    get login_path
    assert_template 'sessions/new'
    login_as @user
    assert logged_in?
  end

  test 'login without remembering' do
    login_as @user, remember: '1'
    delete logout_path
    login_as @user, remember: '0'
    assert_not session[:user_id].nil?
    assert_empty cookies[:remember_token]
    assert_empty cookies[:user_id]
  end

  test 'login with remembering' do
    login_as @user, remember: '1'
    assert_not_empty cookies[:remember_token]
    assert_not_empty cookies[:user_id]
    assert session[:user_id].nil?
    user = assigns(:user) # Fetch @user from controller
    assert_equal user.remember_token, cookies[:remember_token]
    assert user.remembered?(user.remember_token)
  end

  test 'unsuccessful login' do
    get login_path
    assert_template 'sessions/new'
    login_as @user, password: '', remember: '0'
    assert_template 'sessions/new'
    assert flash.any?
    get login_path
    assert flash.empty?
  end
end
