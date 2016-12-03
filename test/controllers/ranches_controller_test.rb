require 'test_helper'

class RanchesControllerTest < ActionController::TestCase
  setup do
    @ranch = ranches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ranches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ranch" do
    assert_difference('Ranch.count') do
      post :create, ranch: { name: @ranch.name }
    end

    assert_redirected_to ranch_path(assigns(:ranch))
  end

  test "should show ranch" do
    get :show, id: @ranch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ranch
    assert_response :success
  end

  test "should update ranch" do
    patch :update, id: @ranch, ranch: { name: @ranch.name }
    assert_redirected_to ranch_path(assigns(:ranch))
  end

  test "should destroy ranch" do
    assert_difference('Ranch.count', -1) do
      delete :destroy, id: @ranch
    end

    assert_redirected_to ranches_path
  end
end
