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
    assert_nil cookies[:remember_token]
    assert_nil cookies[:user_id]
  end

  test 'login with remembering' do
    login_as @user, remember: '1'
    assert logged_in?
    assert_not_empty cookies[:remember_token]
    assert_not_empty cookies[:user_id]
    assert session[:user_id].nil?
    assert_equal assigns(:user).remember_token, cookies[:remember_token]
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
