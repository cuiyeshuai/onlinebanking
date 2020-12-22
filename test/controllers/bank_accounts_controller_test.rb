require 'test_helper'

class BankAccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bank_accounts_url
    assert_response :success
  end

  test "should get show" do
    get "/bank_accounts/1"
    assert_response :success
  end


end
