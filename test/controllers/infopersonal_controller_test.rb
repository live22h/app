require 'test_helper'

class InfopersonalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get infopersonal_index_url
    assert_response :success
  end

end
