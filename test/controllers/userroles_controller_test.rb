require 'test_helper'

class UserrolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @userrole = userroles(:one)
  end

  test "should get index" do
    get userroles_url
    assert_response :success
  end

  test "should get new" do
    get new_userrole_url
    assert_response :success
  end

  test "should create userrole" do
    assert_difference('Userrole.count') do
      post userroles_url, params: { userrole: {  } }
    end

    assert_redirected_to userrole_url(Userrole.last)
  end

  test "should show userrole" do
    get userrole_url(@userrole)
    assert_response :success
  end

  test "should get edit" do
    get edit_userrole_url(@userrole)
    assert_response :success
  end

  test "should update userrole" do
    patch userrole_url(@userrole), params: { userrole: {  } }
    assert_redirected_to userrole_url(@userrole)
  end

  test "should destroy userrole" do
    assert_difference('Userrole.count', -1) do
      delete userrole_url(@userrole)
    end

    assert_redirected_to userroles_url
  end
end
