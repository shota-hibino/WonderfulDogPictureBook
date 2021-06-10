require 'test_helper'

class Public::MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_members_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_members_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_members_update_url
    assert_response :success
  end

  test "should get secession_view" do
    get public_members_secession_view_url
    assert_response :success
  end

  test "should get secession" do
    get public_members_secession_url
    assert_response :success
  end

end
