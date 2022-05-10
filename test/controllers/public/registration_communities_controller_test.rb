require "test_helper"

class Public::RegistrationCommunitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_registration_communities_index_url
    assert_response :success
  end
end
