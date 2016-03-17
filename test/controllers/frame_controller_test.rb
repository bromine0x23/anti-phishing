require 'test_helper'

class FrameControllerTest < ActionController::TestCase
  test "should get reports" do
    get :reports
    assert_response :success
  end

end
