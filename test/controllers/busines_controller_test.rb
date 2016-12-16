require 'test_helper'

class BusinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get busines_index_url
    assert_response :success
  end

  test "should get new" do
    get busines_new_url
    assert_response :success
  end

  test "should get edit" do
    get busines_edit_url
    assert_response :success
  end

end
