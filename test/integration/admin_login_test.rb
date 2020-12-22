require 'test_helper'

class AdminLoginTest < ActionDispatch::IntegrationTest
  test "login with valid credential" do
    get admin_new_url
    assert_response :success
    assert_not admin_is_logged_in?
    assert_template 'admin/sessions/new'
    post admin_new_url, params: { administratorname: "liujianlong", password: "123456"}
    assert_redirected_to '/admin/dashboard'
    follow_redirect!
    assert_template 'admin/dashboard/index'
    assert admin_is_logged_in?
  end
  test "login with invalid credential" do
    get admin_new_url
    assert_response :success
    assert_not admin_is_logged_in?
    assert_template 'admin/sessions/new'
    post admin_new_url, params: { administratorname: "liujianlong", password: "1234567"}
    assert_template 'admin/sessions/new'
    assert_not admin_is_logged_in?
  end
  test "login with valid 2-step confirmation" do
    get admin_new_url
    assert_response :success
    assert_not admin_is_logged_in?
    assert_template 'admin/sessions/new'
    post admin_new_url, params: { administratorname: "lixin", password: "123456"}
    assert_redirected_to  '/admin/verification'
    follow_redirect!
    assert_template 'admin/sessions/verification'
    post admin_verification_url, params: {second_password: "123456"}
    assert_redirected_to '/admin/dashboard'
    follow_redirect!
    assert_template 'admin/dashboard/index'
    assert admin_is_logged_in?
  end
  test "login with invalid 2-step confirmation" do
    get admin_new_url
    assert_response :success
    assert_not admin_is_logged_in?
    assert_template 'admin/sessions/new'
    post admin_new_url, params: { administratorname: "lixin", password: "123456"}
    assert_redirected_to  '/admin/verification'
    follow_redirect!
    assert_template 'admin/sessions/verification'
    post admin_verification_url, params: {second_password: "1234567"}
    assert_template 'admin/sessions/verification'
    assert_not admin_is_logged_in?
  end
end
