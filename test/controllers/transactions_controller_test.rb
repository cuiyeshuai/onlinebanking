require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get transactions_url
    assert_response :success
  end

  test "should get create" do
    post transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_transaction_url
    assert_response :success
  end

  test "should get show" do
    get "/transactions/1"
    assert_response :success
  end

end
