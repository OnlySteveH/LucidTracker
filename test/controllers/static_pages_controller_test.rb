require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get FAQ" do
    get static_pages_FAQ_url
    assert_response :success
     assert_select "title", "FAQ | LucidTracker"
  end

  test "should get Co_to" do
    get static_pages_Co_to_url
    assert_response :success
     assert_select "title", "Co_to | LucidTracker"
  end

end
