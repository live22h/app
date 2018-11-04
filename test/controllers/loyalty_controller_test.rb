require 'test_helper'

class LoyaltyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get loyalty_index_url
    assert_response :success
  end

end
