class DynamicController < ApplicationController
  def getMachines
    @all_machines = Machine.order("machineId")
    options = ""
    machine = Machine.where("floor = ?", params[:id])
    
    machine.each do |s|
      options << "<option value=#{s.id}>#{s.machineId}</option>"
    end
    render :text => options
  end
end
