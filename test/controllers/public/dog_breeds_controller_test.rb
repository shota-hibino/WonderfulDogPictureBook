require 'test_helper'

class Public::DogBreedsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_dog_breeds_index_url
    assert_response :success
  end

  test "should get show" do
    get public_dog_breeds_show_url
    assert_response :success
  end

end
