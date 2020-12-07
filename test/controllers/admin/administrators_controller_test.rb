require 'test_helper'

class Admin::AdministratorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_administrators_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_administrators_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_administrators_new_url
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
