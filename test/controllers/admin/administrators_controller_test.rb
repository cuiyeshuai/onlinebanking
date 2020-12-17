require 'test_helper'

class Admin::AdministratorsControllerTest < ActionDispatch::IntegrationTest
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
