require 'test_helper'

class Admin::DogBreedsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_dog_breeds_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_dog_breeds_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_dog_breeds_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_dog_breeds_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_dog_breeds_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_dog_breeds_update_url
    assert_response :success
  end

end
