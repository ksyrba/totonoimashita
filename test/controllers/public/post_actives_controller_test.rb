require "test_helper"

class Public::PostActivesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_post_actives_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_post_actives_edit_url
    assert_response :success
  end
end
