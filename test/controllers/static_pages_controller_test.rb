require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get spis" do
    get static_pages_spis_url
    assert_response :success
  end

  test "should get strona" do
    get static_pages_strona_url
    assert_response :success
  end
   test "should get faq" do
    get static_pages_faq_url
    assert_response :success
     
  end

  test "should get co_to" do
    get static_pages_co_to_url
    assert_response :success
     
  end

end
