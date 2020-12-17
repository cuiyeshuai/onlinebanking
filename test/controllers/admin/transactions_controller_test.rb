require 'test_helper'

class Admin::TransactionsControllerTest < ActionDispatch::IntegrationTest

test "should get index" do
  get admin_transactions_url
  assert_response :success
end

test "should get show" do
  get "/admin/transactions/1"
  assert_response :success
end

test "should get new" do
  get new_admin_transaction_url
  assert_response :success
end

test "should get create" do
  post admin_transactions_url
  assert_response :success
end

test "should get edit" do
  get "/admin/transactions/1/edit"
  assert_response :success
end

test "should get update" do
  patch "/admin/transactions/1"
  assert_response :success
end

test "should get delete" do
  get "/admin/transactions/1/delete"
  assert_response :success
end

test "should get destroy" do
  delete "/admin/transactions/1"
  assert_response :success
end

end
