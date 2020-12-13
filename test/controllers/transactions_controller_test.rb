require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get transactions index" do
    get transactions_path
    assert_response :success
  end

  test "should get show" do
    get transaction_path(1)
    assert_response :success
  end

  test "should get new" do
    get new_transaction_path
    assert_response :success
  end

  test "should get create" do
    post transactions_path
    assert_response :success
  end

  test "should get edit" do
    get transactions_edit_url
    assert_response :missing
  end
end
