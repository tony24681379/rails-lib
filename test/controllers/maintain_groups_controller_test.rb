require 'test_helper'

class MaintainGroupsControllerTest < ActionController::TestCase
  setup do
    @maintain_group = maintain_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maintain_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maintain_group" do
    assert_difference('MaintainGroup.count') do
      post :create, maintain_group: { group: @maintain_group.group, user_id: @maintain_group.user_id }
    end

    assert_redirected_to maintain_group_path(assigns(:maintain_group))
  end

  test "should show maintain_group" do
    get :show, id: @maintain_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @maintain_group
    assert_response :success
  end

  test "should update maintain_group" do
    patch :update, id: @maintain_group, maintain_group: { group: @maintain_group.group, user_id: @maintain_group.user_id }
    assert_redirected_to maintain_group_path(assigns(:maintain_group))
  end

  test "should destroy maintain_group" do
    assert_difference('MaintainGroup.count', -1) do
      delete :destroy, id: @maintain_group
    end

    assert_redirected_to maintain_groups_path
  end
end
