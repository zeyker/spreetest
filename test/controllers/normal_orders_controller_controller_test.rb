require 'test_helper'

class NormalOrdersControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get gateway" do
    get normal_orders_controller_gateway_url
    assert_response :success
  end

end
