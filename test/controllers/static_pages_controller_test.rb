require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get contents' do
    get contents_url
    assert_response :success
  end

  test 'should get home' do
    get root_url
    assert_response :success
  end

  test 'should get faq' do
    get faq_url
    assert_response :success
  end

  test 'should get about' do
    get about_url
    assert_response :success

  end

end
