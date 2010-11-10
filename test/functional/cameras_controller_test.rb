require 'test_helper'

class CamerasControllerTest < ActionController::TestCase
  setup do
    @camera = cameras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cameras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create camera" do
    assert_difference('Camera.count') do
      post :create, :camera => @camera.attributes
    end

    assert_redirected_to camera_path(assigns(:camera))
  end

  test "should show camera" do
    get :show, :id => @camera.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @camera.to_param
    assert_response :success
  end

  test "should update camera" do
    put :update, :id => @camera.to_param, :camera => @camera.attributes
    assert_redirected_to camera_path(assigns(:camera))
  end

  test "should destroy camera" do
    assert_difference('Camera.count', -1) do
      delete :destroy, :id => @camera.to_param
    end

    assert_redirected_to cameras_path
  end
end
