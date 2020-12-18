require 'test_helper'

class LPageControllerTest < ActionDispatch::IntegrationTest
  test "should get l_page index" do
    get  l_page_path
    assert_response :success
  end

end
