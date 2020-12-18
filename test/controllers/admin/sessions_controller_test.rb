require 'test_helper'

class Admin::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_new_url
    assert_response :success
  end

  test "should get create" do
    post admin_dashboard_index
    assert_response :success
  end

  test "should get destroy" do
    delete admin_logout_url
    assert_response :redirect
  end

end
