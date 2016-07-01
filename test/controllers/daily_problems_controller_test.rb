require 'test_helper'

class DailyProblemsControllerTest < ActionController::TestCase
  setup do
    @daily_problem = daily_problems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:daily_problems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create daily_problem" do
    assert_difference('DailyProblem.count') do
      post :create, daily_problem: { comment: @daily_problem.comment, date: @daily_problem.date, machine_id: @daily_problem.machine_id, maintainer_id: @daily_problem.maintainer_id, problem_category: @daily_problem.problem_category, problem_detail: @daily_problem.problem_detail, situation: @daily_problem.situation, user_id: @daily_problem.user_id }
    end

    assert_redirected_to daily_problem_path(assigns(:daily_problem))
  end

  test "should show daily_problem" do
    get :show, id: @daily_problem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @daily_problem
    assert_response :success
  end

  test "should update daily_problem" do
    patch :update, id: @daily_problem, daily_problem: { comment: @daily_problem.comment, date: @daily_problem.date, machine_id: @daily_problem.machine_id, maintainer_id: @daily_problem.maintainer_id, problem_category: @daily_problem.problem_category, problem_detail: @daily_problem.problem_detail, situation: @daily_problem.situation, user_id: @daily_problem.user_id }
    assert_redirected_to daily_problem_path(assigns(:daily_problem))
  end

  test "should destroy daily_problem" do
    assert_difference('DailyProblem.count', -1) do
      delete :destroy, id: @daily_problem
    end

    assert_redirected_to daily_problems_path
  end
end
