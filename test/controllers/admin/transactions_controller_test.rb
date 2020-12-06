require 'test_helper'

class Admin::TransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_transactions_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_transactions_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_transactions_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_transactions_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_transactions_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_transactions_update_url
    assert_response :success
  end

  test "should get delete" do
    get admin_transactions_delete_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_transactions_destroy_url
    assert_response :success
  end

end
