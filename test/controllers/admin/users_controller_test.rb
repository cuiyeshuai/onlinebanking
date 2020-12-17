require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_users_url
    assert_response :success
  end

  test "should get show" do
    get "/admin/users/1"
    assert_response :success
  end

  test "should get new" do
    get new_admin_user_url
    assert_response :success
  end

  test "should get create" do
    assert_difference('User.count', 1) do
      post admin_users_url, params: {user: {username: "ahmed", first_name: "patricia", last_name: "pickles", password_digest: "$2a$12$QQWIIPONC.Q2kKY/q6rEFeuFTkVWac", gender: 1, date_of_birth: 1990-01-01, phone_number: "090078601", address: "Mohatta P"}}
    end
    assert_response :success
  end

  test "should get edit" do
    get "/admin/users/1/edit"
    assert_response :missing
  end


  test "should get update" do
    patch "/admin/users/1"
    assert_response :success
  end

  test "should delete user" do
    user = users(:one)
    assert_difference('User.count', -1) do
      delete admin_user_url(user)
    end
    assert_redirected_to admin_users_url
  end

end
