require "test_helper"

class Public::DeliverysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_deliverys_index_url
    assert_response :success
  end

  test "should get show" do
    get public_deliverys_show_url
    assert_response :success
  end

  test "should get new" do
    get public_deliverys_new_url
    assert_response :success
  end
end
