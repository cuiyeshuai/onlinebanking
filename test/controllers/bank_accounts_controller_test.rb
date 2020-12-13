require 'test_helper'

class BankAccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bank_accounts_path
    assert_response :success
  end

  test "bank account should have user" do
    assert_equal users(one), bank_accounts(:one).user
  end

  test "should get bank_account show" do
    acc = bank_accounts(:one).id
    get bank_account_path(acc)
    assert_response :success
  end

  #test "should get new" do
 #   get bank_accounts_new_url
  #  assert_response :success
  #end

 # test "should get create" do
  #  post bank_accounts_path
 #  assert_response :missing
 # end

end
