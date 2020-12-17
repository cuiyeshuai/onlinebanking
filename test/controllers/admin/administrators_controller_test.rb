require 'test_helper'

class Admin::AdministratorsControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
  test "should get index" do
    get "/admin/administrators"
    assert_response :success
  end

  test "should get show" do
    get "/admin/administrators/1"
    assert_response :success
  end

  test "should get new" do
    get "/admin/administrators/new"
=======
  test "should get admin root path" do
    get admin_root_path
    assert_response :success
  end

  test "should get delete admin administrator" do
    get delete_admin_administrator_path
    assert_response :success
  end

  test "should get admin administrator index" do
    get admin_administrators_path
    assert_response :success
  end

  test "should get admin administrator create" do
    post admin_administrators_path
    assert_response :success
  end

  test "should get admin administrator new" do
    get new_admin_administrator_path
>>>>>>> 8d95ceddd2611dc36749c21970f376cb80471720
    assert_response :success
  end

  test "should get create" do
    post admin_administrators_url, params: {administrator: {administratorname: "John", password_digest: "password"}}
    assert_response :success
  end
  
  test "should get edit" do
    get "/admin/administrators/1/edit"
    assert_response :success
  end

  test "should get update" do
    patch "/admin/administrators/1"
    assert_response :success
  end

  test "should get destroy" do
    delete "/admin/administrators/1"
    assert_response :success
  end

end
