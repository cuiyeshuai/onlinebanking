require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get '/login'
    assert_response :success
  end

  test "should redirect_to dashboard with correct username and password" do
    post '/login', params: {username:"mystring1", password:"password"}
    assert_redirected_to(controller: 'l_page', action: 'index')
  end

  test "should redirect_to login page with incorrect username or password" do
    post '/login', params: {username:"Jiaqing", password:"123"}
    assert_template 'sessions/login'
  end


end
