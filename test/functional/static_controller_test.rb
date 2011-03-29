require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get construction" do
    get :construction
    assert_response :success
  end

  test "should get gallery" do
    get :gallery
    assert_response :success
  end

  test "should get distributors" do
    get :distributors
    assert_response :success
  end

  test "should get sizes" do
    get :sizes
    assert_response :success
  end

  test "should get custom" do
    get :custom
    assert_response :success
  end

end
