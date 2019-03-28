require 'test_helper'

class PersonPhotoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get person_photo_index_url
    assert_response :success
  end

  test "should get show" do
    get person_photo_show_url
    assert_response :success
  end

  test "should get new" do
    get person_photo_new_url
    assert_response :success
  end

  test "should get create" do
    get person_photo_create_url
    assert_response :success
  end

  test "should get destroy" do
    get person_photo_destroy_url
    assert_response :success
  end

end
