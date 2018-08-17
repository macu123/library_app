require 'test_helper'

class CopiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get copies_index_url
    assert_response :success
  end

  test "should get show" do
    get copies_show_url
    assert_response :success
  end

end
