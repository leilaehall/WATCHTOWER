require 'test_helper'

class WatchesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get watches_show_url
    assert_response :success
  end

end
