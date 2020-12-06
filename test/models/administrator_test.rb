require 'test_helper'

class AdministratorTest < ActiveSupport::TestCase
  def setup
    @administrator = Administrator.new({administratorname:"giao", password:"123456",password_confirmation:"123456"})
  end

  test "default administrator should be valid" do 
    assert @administrator.valid?
  end

  test "administrator with no match password shouldn't be valid" do
    @administrator.password = "wuhu"
    assert_not @administrator.valid?
  end

  test "administrator name should be unique" do
    duplicate = @administrator.dup
    duplicate.administratorname = duplicate.administratorname.upcase
    @administrator.save
    assert_not duplicate.valid?
  end

  test "administrator name should be at least 4 characters" do
    @administrator.administratorname = "dfs"
    assert_not @administrator.valid?
  end

  test "administrator name should be no more than 30 characters" do
    @administrator.administratorname = "a" * 31
    assert_not @administrator.valid?
  end

  test "administrator name should not be blank" do 
    @administrator.administratorname = " "*4
    assert_not @administrator.valid?
  end

  test "administrator password should not be blank" do 
    @administrator.password = @administrator.password_confirmation = " "*6
    assert_not @administrator.valid?
  end

  test "administrator password should be at least 6 characters" do
    @administrator.password = @administrator.password_confirmation = "dfs"
    assert_not @administrator.valid?
  end

  
end
