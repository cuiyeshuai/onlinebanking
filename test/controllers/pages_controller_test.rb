require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get dummy page fees" do
    get '/pages/fees'
    assert_response :success
  end

  test "should get dummy page invest" do
    get '/pages/invest'
    assert_response :success
  end

end
