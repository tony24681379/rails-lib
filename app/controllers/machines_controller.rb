class MachinesController < ApplicationController
  before_action :set_machine, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @machines = Machine.all
    respond_with(@machines)
  end

  def show
   respond_with(@machine)
  end

  def new
    @machine = Machine.new
    respond_with(@machine)
  end

  def edit
  end

  def create
    @machine = Machine.new(machine_params)
    @machine.save
    redirect_to :action => 'index'
  end

  def update
    @machine.update(machine_params)
    respond_with(@machine)
  end

  def destroy
    @machine.destroy
    respond_with(@machine)
  end

  private
    def set_machine
      @machine = Machine.find(params[:id])
    end

    def machine_params
      params.require(:machine).permit(:floor, :machineId)
    end
end
