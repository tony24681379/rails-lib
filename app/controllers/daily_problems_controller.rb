class DailyProblemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_daily_problem, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @daily_problems = DailyProblem.joins("join machines m on daily_problems.machine_id = m.id
      join users u on daily_problems.user_id = u.account") \
      .select("daily_problems.*, m.machine_name as machine_name, u.username")
    respond_with(@daily_problems)
  end

  def show
    user_name = User.find_by(:account => @daily_problem.user_id)
    @user_name = user_name.username
    @machineId = Machine.find(@daily_problem.machine_id).machine_name
    respond_with(@daily_problem)
  end

  def new
    @daily_problem = DailyProblem.new
    @all_machines = Machine.order("machine_name")
    respond_with(@daily_problem)
  end

  def edit
    @all_machines = Machine.order("machine_name")
  end

  def create
    @daily_problem = DailyProblem.new(daily_problem_params)
    @daily_problem.save
    respond_with(@daily_problem)
  end

  def update
    @daily_problem.update(daily_problem_params)
    respond_with(@daily_problem)
  end

  def destroy
    @daily_problem.destroy
    respond_with(@daily_problem)
  end

  private
    def set_daily_problem
      @daily_problem = DailyProblem.find(params[:id])
    end

    def daily_problem_params
      params.require(:daily_problem).permit(:date, :machine_id, :user_id, :problem_category, :problem_detail, :maintainer_id, :situation, :comment)
    end
end
