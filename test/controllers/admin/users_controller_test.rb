require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    admin = administrators(:one)
    log_in_as_admin(admin, "123456")
    get admin_users_url
    assert_response :success
  end

  test "should get show" do
    admin = administrators(:one)
    user = users(:user1)
    log_in_as_admin(admin, "123456")
    get admin_user_url(user)
    assert_response :success
  end

  test "should get new" do
    admin = administrators(:one)
    log_in_as_admin(admin, "123456")
    get new_admin_user_url
    assert_response :success
  end

  test "should get create" do
    admin = administrators(:one)
    log_in_as_admin(admin, "123456")
    assert_difference('User.count', 1) do
      post admin_users_url, params: {user: {username: "ahmed", first_name: "patricia", last_name: "pickles", password: "123456", password_confirmation: "123456", gender: 1, date_of_birth: 1990-01-01, phone_number: "090078601", address: "Mohatta P"}}
    end
    assert_response :success
  end

  test "should get edit" do
    get "/admin/users/1/edit"
    assert_response :success
  end


  test "should get update" do
    patch "/admin/users/1"
    assert_response :success
  end

  test "should delete user" do
    admin = administrators(:one)
    log_in_as_admin(admin, "123456")
    user = users(:user1)
    assert_difference('User.count', -1) do
      delete admin_user_url(user)
    end
    assert_redirected_to admin_users_url
  end

end
