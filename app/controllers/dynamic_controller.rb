class DynamicController < ApplicationController
  def getMachines
    @all_machines = Machine.order("machine_name")
    options = ""
    machine = Machine.where("floor = ?", params[:id])
    machine.each do |s|
      options << "<option value=#{s.id}>#{s.machine_name}</option>"
    end
    render :text => options
  end
end
