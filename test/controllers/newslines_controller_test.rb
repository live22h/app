require 'test_helper'

class NewslinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @newsline = newslines(:one)
  end

  test "should get index" do
    get newslines_url
    assert_response :success
  end

  test "should get new" do
    get new_newsline_url
    assert_response :success
  end

  test "should create newsline" do
    assert_difference('Newsline.count') do
      post newslines_url, params: { newsline: {  } }
    end

    assert_redirected_to newsline_url(Newsline.last)
  end

  test "should show newsline" do
    get newsline_url(@newsline)
    assert_response :success
  end

  test "should get edit" do
    get edit_newsline_url(@newsline)
    assert_response :success
  end

  test "should update newsline" do
    patch newsline_url(@newsline), params: { newsline: {  } }
    assert_redirected_to newsline_url(@newsline)
  end

  test "should destroy newsline" do
    assert_difference('Newsline.count', -1) do
      delete newsline_url(@newsline)
    end

    assert_redirected_to newslines_url
  end
end
