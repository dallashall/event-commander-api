require 'test_helper'

class Api::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get resources" do
    get api_users_resources_url
    assert_response :success
  end

end
