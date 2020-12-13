require 'test_helper'

class Admin::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_sessions_new_url
    assert_response :success
  end

  test "should get verification" do
    get admin_sessions_verification_url
    assert_response :success
  end

  test "should get success" do
    get admin_sessions_success_url
    assert_response :success
  end

end
