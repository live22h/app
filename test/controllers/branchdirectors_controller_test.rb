require 'test_helper'

class BranchdirectorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @branchdirector = branchdirectors(:one)
  end

  test "should get index" do
    get branchdirectors_url
    assert_response :success
  end

  test "should get new" do
    get new_branchdirector_url
    assert_response :success
  end

  test "should create branchdirector" do
    assert_difference('Branchdirector.count') do
      post branchdirectors_url, params: { branchdirector: {  } }
    end

    assert_redirected_to branchdirector_url(Branchdirector.last)
  end

  test "should show branchdirector" do
    get branchdirector_url(@branchdirector)
    assert_response :success
  end

  test "should get edit" do
    get edit_branchdirector_url(@branchdirector)
    assert_response :success
  end

  test "should update branchdirector" do
    patch branchdirector_url(@branchdirector), params: { branchdirector: {  } }
    assert_redirected_to branchdirector_url(@branchdirector)
  end

  test "should destroy branchdirector" do
    assert_difference('Branchdirector.count', -1) do
      delete branchdirector_url(@branchdirector)
    end

    assert_redirected_to branchdirectors_url
  end
end
