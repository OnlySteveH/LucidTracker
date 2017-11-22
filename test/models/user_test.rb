require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'parrot', email: 'parrot@yios.com',
                     password: 'Parrot-7', password_confirmation: 'Parrot-7')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should not be blank' do
    @user.name = '  '
    assert_not @user.valid?
  end

  test 'name should not be too long' do
    @user.name = 'a' * 11
    assert_not @user.valid?
  end

  test 'name should not be too short' do
    @user.name = 'a' * 2
    assert_not @user.valid?
  end

  test 'name should consist of only certain characters' do
    # Add some asserts here
  end

  test 'email should not be blank' do
    @user.email = '  '
    assert_not @user.valid?
  end

  test 'valid emails should be valid' do
    valid_emails = %w[seed-123@whop.whop.com SeEd@birb-page.com
                      pee_ka_boo@t.org whatEv@123.and.more.seeds.com]
    valid_emails.each do |email|
      @user.email = email
      assert @user.valid?, "User with valid email #{email} is not valid"
    end
  end

  test 'invalid emails should be invalid' do
    invalid_emails = %w[w/o=t@isdat @seed te@st..com no@dot,com 123@45.67 asd]
    invalid_emails.each do |email|
      @user.email = email
      assert_not @user.valid?, "User with invalid email #{email} is valid"
    end
  end

  test 'password should not be blank' do
    @user.password = @user.password_confirmation = '  '
    assert_not @user.valid?
  end

  test 'password should have a minimum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end
end
