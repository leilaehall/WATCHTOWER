require 'test_helper'

class MyWatchesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get my_watches_new_url
    assert_response :success
  end

  test "should get create" do
    get my_watches_create_url
    assert_response :success
  end

end
