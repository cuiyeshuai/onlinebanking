require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test "login with valid credential" do
    user = User.new({username: "user1", first_name: "jianlong", last_name: "liu", password: "123456", 
      password_confirmation: "123456", gender: 2, date_of_birth: Date.today, phone_number:"123456789", 
      address: "hebeibaoding"})
    user.save
    get login_url
    assert_response :success
    assert_not user_is_logged_in?
    assert_template 'sessions/login'
    post login_url, params: { username: "mystring1", password: "password"}
    assert_redirected_to '/dashboard'
    follow_redirect!
    assert_template 'l_page/index'
    assert user_is_logged_in?
  end
  test "login with invalid credential" do
    user = User.new({username: "user1", first_name: "jianlong", last_name: "liu", password: "123456", 
      password_confirmation: "123456", gender: 2, date_of_birth: Date.today, phone_number:"123456789", 
      address: "hebeibaoding"})
    user.save
    get login_url
    assert_response :success
    assert_not user_is_logged_in?
    assert_template 'sessions/login'
    post login_url, params: { username: "user1", password: "1234567"}
    assert_response :success
    assert_template 'sessions/login'
    assert_not user_is_logged_in?
  end
end
