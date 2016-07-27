require 'test_helper'

class MaintainStatesControllerTest < ActionController::TestCase
  setup do
    @maintain_state = maintain_states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maintain_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maintain_state" do
    assert_difference('MaintainState.count') do
      post :create, maintain_state: { state: @maintain_state.state }
    end

    assert_redirected_to maintain_state_path(assigns(:maintain_state))
  end

  test "should show maintain_state" do
    get :show, id: @maintain_state
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @maintain_state
    assert_response :success
  end

  test "should update maintain_state" do
    patch :update, id: @maintain_state, maintain_state: { state: @maintain_state.state }
    assert_redirected_to maintain_state_path(assigns(:maintain_state))
  end

  test "should destroy maintain_state" do
    assert_difference('MaintainState.count', -1) do
      delete :destroy, id: @maintain_state
    end

    assert_redirected_to maintain_states_path
  end
end
