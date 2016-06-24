class DailiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_daily, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @dailies = Daily.joins("join machines m on dailies.machineid = m.id
      join users u on dailies.userId = u.account") \
      .select("dailies.*, m.machineId as machine_name, u.username")
    respond_with(@dailies)
  end

  def show
    user_name = User.find_by(:account => @daily.userId)
    @user_name = user_name.username
    @machineId = Machine.find(@daily.machineId).machineId
    respond_with(@daily)
  end

  def new
    @daily = Daily.new
    @all_machines = Machine.order("machineId")
    respond_with(@daily)
  end

  def edit
    @all_machines = Machine.order("machineId")
  end

  def create
    @daily = Daily.new(daily_params)
    @daily.save
    respond_with(@daily)
  end

  def update
    @daily.update(daily_params)
    respond_with(@daily)
  end

  def destroy
    @daily.destroy
    respond_with(@daily)
  end

  private
    def set_daily
      @daily = Daily.find(params[:id])
    end

    def daily_params
      params.require(:daily).permit(:floor, :machineId, :userId, :problemCategory, :problemDetail, :date, :comment, :maintainerId, :situation)
    end
end
