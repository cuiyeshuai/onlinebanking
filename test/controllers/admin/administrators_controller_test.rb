require 'test_helper'

class Admin::AdministratorsControllerTest < ActionDispatch::IntegrationTest
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
    assert_response :success
  end

  test "should get create" do
    get admin_administrators_create_url
    assert_response :success
  end
  
  test "should get edit" do
    get admin_administrators_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_administrators_update_url
    assert_response :success
  end

  test "should get delete" do
    get admin_administrators_delete_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_administrators_destroy_url
    assert_response :success
  end

end
