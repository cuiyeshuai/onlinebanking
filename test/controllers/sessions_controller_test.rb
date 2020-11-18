require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get sessions_login_url
    assert_response :success
  end

  test "should get verification" do
    get sessions_verification_url
    assert_response :success
  end

  test "should get success" do
    get sessions_success_url
    assert_response :success
  end

end
