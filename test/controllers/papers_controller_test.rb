require "test_helper"

class PapersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get papers_new_url
    assert_response :success
  end
end
