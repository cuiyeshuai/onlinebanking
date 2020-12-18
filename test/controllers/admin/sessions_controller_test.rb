require 'test_helper'

class Admin::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login page" do
    get admin_new_url
    assert_response :success
  end

  test "should redirect to dashboard when logged in" do
    post admin_new_url params: {administratorname: "liujianlong", password: "123456"}
    assert_redirected_to '/admin/dashboard'
  end


end
