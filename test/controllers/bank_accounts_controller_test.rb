require 'test_helper'

class BankAccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bank_accounts_path
    assert_response :success
  end

  test "should get show" do
    acc = BankAccount.new
    acc.amount = 2
    acc.currency = "EUR"
    acc.type_of_account = "saings"
    acc.save
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
