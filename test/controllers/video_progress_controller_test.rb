require "test_helper"

class VideoProgressControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get video_progress_create_url
    assert_response :success
  end
end
