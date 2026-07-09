require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get clientes" do
    get dashboard_clientes_url
    assert_response :success
  end
end
