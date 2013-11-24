require 'test_helper'

class MocksControllerTest < ActionController::TestCase
  test "should get mock_activities" do
    get :mock_activities
    assert_response :success
  end

  test "should get mock_products" do
    get :mock_products
    assert_response :success
  end

end
