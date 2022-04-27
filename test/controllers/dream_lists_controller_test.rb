require "test_helper"

class DreamListsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dream_lists_new_url
    assert_response :success
  end

  test "should get index" do
    get dream_lists_index_url
    assert_response :success
  end

  test "should get show" do
    get dream_lists_show_url
    assert_response :success
  end

  test "should get edit" do
    get dream_lists_edit_url
    assert_response :success
  end
end
