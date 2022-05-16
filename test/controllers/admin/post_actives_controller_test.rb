require "test_helper"

class Admin::PostActivesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_post_actives_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_post_actives_edit_url
    assert_response :success
  end
end
