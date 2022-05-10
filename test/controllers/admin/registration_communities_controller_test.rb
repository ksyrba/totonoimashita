require "test_helper"

class Admin::RegistrationCommunitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_registration_communities_index_url
    assert_response :success
  end
end
