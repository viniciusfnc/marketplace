require 'test_helper'

class KipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kips_index_url
    assert_response :success
  end

  test "should get new" do
    get kips_new_url
    assert_response :success
  end

  test "should get edit" do
    get kips_edit_url
    assert_response :success
  end

  test "should get delete" do
    get kips_delete_url
    assert_response :success
  end

  test "should get show" do
    get kips_show_url
    assert_response :success
  end

end
