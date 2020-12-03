require 'test_helper'

class LPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get l_page_index_url
    assert_response :success
  end

end
