require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new({username: "Jiaqing", password: "123456",password_confirmation: "123456", first_name: "Jiaqing", last_name:"Nie", date_of_birth: Time.local(1999,10,21), phone_number: "11111111111", address: "E1 4EY", gender: 1})

  end

  test "default user should be valid" do
    assert @user.valid?
  end

  test "user with non-macthing passwords is invalid" do
    @user.password = "123123"
    assert_not @user.valid?
  end

  test "username should be at least 4 characters" do
    @user.username = "XXX"
    assert_not @user.valid?
  end

  test "username should be no more than 30 characters" do
    @user.username = "X" * 31
    assert_not @user.valid?
  end

  test "username should not be blank" do
    @user.username = " " * 4
    assert_not @user.valid?
  end

  test "username should be unique" do
    duplicate_user = @user.dup
    duplicate_user.username = duplicate_user.username.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "username should be downcased before saving" do
    origin_username = @user.username
    @user.save
    assert_not (origin_username == @user.username)
  end

  test "password should not be blank" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have at least 6 characters" do
    @user.password = @user.password_confirmation =  "x" * 5
    assert_not @user.valid?
  end
end
