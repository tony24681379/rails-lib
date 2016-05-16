require 'test_helper'

class ProblemCategoriesControllerTest < ActionController::TestCase
  setup do
    @problem_category = problem_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:problem_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create problem_category" do
    assert_difference('ProblemCategory.count') do
      post :create, problem_category: { problem: @problem_category.problem }
    end

    assert_redirected_to problem_category_path(assigns(:problem_category))
  end

  test "should show problem_category" do
    get :show, id: @problem_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @problem_category
    assert_response :success
  end

  test "should update problem_category" do
    patch :update, id: @problem_category, problem_category: { problem: @problem_category.problem }
    assert_redirected_to problem_category_path(assigns(:problem_category))
  end

  test "should destroy problem_category" do
    assert_difference('ProblemCategory.count', -1) do
      delete :destroy, id: @problem_category
    end

    assert_redirected_to problem_categories_path
  end
end
