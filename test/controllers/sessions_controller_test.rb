require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get '/login'
    assert_response :success
  end

  test "should redirect_to success page with correct username and password" do
    post '/login', params: {username:"Jiaqing", password:"123456"}
    assert_redirected_to(controller: 'sessions', action: 'success')
  end

  test "should redirect_to login page with incorrect username or password" do
    post '/login', params: {username:"Jiaqing", password:"123"}
    assert_redirected_to(controller: 'sessions', action: 'login')
  end

  test "should get success" do
    get '/success'
    assert_response :success
  end

end
