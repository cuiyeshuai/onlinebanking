require 'test_helper'

class Admin::BankAccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_bank_accounts_url
    assert_response :success
  end

  test "should get show" do
    get "/bank_accounts/1"
    assert_response :success
  end

  test "should get new" do
    get new_admin_bank_account_url
    assert_response :success
  end

  test "should get create" do
    assert_dfference('BankAccount'.count, 1) do
      post "/admin/bank_accounts"
    end
    assert_response :success
  end

  test "should get edit" do
    get "/admin/bank_accounts/1/edit"
    assert_response :success
  end

  test "should get update" do
    patch "/admin/bank_accounts/1"
    assert_response :success
  end

  test "delete should remove bank account" do
    assert_dfference('BankAccount'.count, -1) do
      delete "/admin/bank_accounts/1"
    end
    assert_response :success
  end

end
