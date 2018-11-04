require 'test_helper'

class BannerpartnerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bannerpartner_index_url
    assert_response :success
  end

end
