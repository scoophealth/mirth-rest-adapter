require 'test_helper'

class RecordsControllerTest < ActionController::TestCase
  test "should get relay" do
    get :relay
    assert_response :success
  end

end
