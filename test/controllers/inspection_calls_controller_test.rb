require "test_helper"

class InspectionCallsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inspection_calls_index_url
    assert_response :success
  end
end
