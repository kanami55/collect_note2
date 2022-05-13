require "test_helper"

class NotToDoListsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get not_to_do_lists_new_url
    assert_response :success
  end

  test "should get index" do
    get not_to_do_lists_index_url
    assert_response :success
  end

  test "should get edit" do
    get not_to_do_lists_edit_url
    assert_response :success
  end
end
