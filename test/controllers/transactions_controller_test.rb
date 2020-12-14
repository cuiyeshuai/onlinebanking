require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get transactions index" do
    get transactions_path
    assert_response :success
  end

  test "transaction should have bank account" do
    assert_equal bank_accounts(:one), transactions(:one).bank_account
  end

  test "should get show" do
    transactionId = transactions(:one).id
    get transaction_path(transactionId)
    assert_response :success
  end

  test "should get new" do
    get new_transaction_path
    assert_response :success
  end

  test "should get transactions create" do
    post transactions_path
    assert_response :success
  end

end
