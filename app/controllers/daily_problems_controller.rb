class DailyProblemsController < ApplicationController
  before_action :set_daily_problem, only: [:show, :edit, :update, :destroy]

  # GET /daily_problems
  # GET /daily_problems.json
  def index
    @states = MaintainState.all
    @daily_problems = DailyProblem.joins("
      join machines m on daily_problems.machine_id = m.machine_id
      join users u on daily_problems.user_id = u.account") \
      .select("daily_problems.*, m.branch, m.place, m.floor, u.username")
      .order("date DESC")
      #.where("situation = ?",@states.first.state)
    @daily_problems.each do |daily_problem|
      if not daily_problem.comment.blank?
        daily_problem.situation = "已完成"
      end
      group = Machine.where("machine_id = ?", daily_problem.machine_id).first.maintain_group
      
      case group
      when 'Kiosk查詢平台'
        daily_problem.maintainer_id = '陳玉芬'
      when '非靠卡電腦'
        daily_problem.maintainer_id = '高見成'
      when '一般靠卡電腦'
        daily_problem.maintainer_id = '高見成'
      when '預約靠卡電腦'
        daily_problem.maintainer_id = '高見成'
      when '多媒體設備'
        daily_problem.maintainer_id = '黃美惠'
      end
      
    end
    
    # Machine.where("machine_id = ?", DailyProblem.first.machine_id).select("place")
    
    # test for chart
    @dailys = DailyProblem.all
  end

  # GET /daily_problems/1
  # GET /daily_problems/1.json
  def show
    user_name = User.find_by(:account => @daily_problem.user_id)
    @user_name = user_name.username
  end

  # GET /daily_problems/new
  def new
    @daily_problem = DailyProblem.new
    @libaries = Library.select('branch').distinct
    @floor = Machine.select('floor').distinct
    @all_machines = Machine.order("machine_id")
    @maintain_state = MaintainState.select('state').distinct
  end

  # GET /daily_problems/1/edit
  def edit
    @libaries = Library.select('branch').distinct
    @floor = Machine.select('floor').distinct
    @all_machines = Machine.order("machine_id")
    @maintain_state = MaintainState.select('state').distinct
  end

  # POST /daily_problems
  # POST /daily_problems.json
  def create
    @daily_problem = DailyProblem.new(daily_problem_params)
    @daily_problem.user_id = current_user.account
    respond_to do |format|
      if @daily_problem.save
        format.html { redirect_to :action => 'index', notice: 'Daily problem was successfully created.' }
        format.json { render :show, status: :created, location: @daily_problem }
      else
        format.html { render :new }
        format.json { render json: @daily_problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_problems/1
  # PATCH/PUT /daily_problems/1.json
  def update
    @daily_problem.user_id = current_user.account
    respond_to do |format|
      if @daily_problem.update(daily_problem_params)
        format.html { redirect_to @daily_problem, notice: 'Daily problem was successfully updated.' }
        format.json { render :show, status: :ok, location: @daily_problem }
      else
        format.html { render :edit }
        format.json { render json: @daily_problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_problems/1
  # DELETE /daily_problems/1.json
  def destroy
    @daily_problem.destroy
    respond_to do |format|
      format.html { redirect_to daily_problems_url, notice: 'Daily problem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_floors
    options = ""
    library = Library.where("branch = ?", params[:branch])
    library.each do |s|
      options << "<option value=#{s.floor}>#{s.floor}</option>"
    end
    render :text => options
  end
  
  def get_machines
    options = ""
    machine = Machine.where("branch = ? and floor = ?", params[:branch], params[:floor])
    machine.each do |s|
      options << "<option value=#{s.id}>#{s.machine_id}</option>"
    end
    render :text => options
  end
  
  def get_problems
   #@daily_problems = DailyProblem.joins("
   #    join machines m on daily_problems.machine_id = m.machine_id
   #    join users u on daily_problems.user_id = u.account") \
   #    .select("daily_problems.*, m.branch, m.place, m.floor, u.username")
   #    .where("situation = ?",params[:state])
   #    .order("date DESC")
   redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_problem
      @daily_problem = DailyProblem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_problem_params
      params.require(:daily_problem).permit(:date, :machine_id, :user_id, :problem_detail, :situation, :maintainer_id, :comment)
    end
end
