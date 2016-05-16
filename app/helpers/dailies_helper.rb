module DailiesHelper
  def getmachine
    puts "getmachine"
    puts "enter getmachine"
    options = ""
    #machine = Machine.where("floor = ?", params[:id])
    machine = Machine.where("floor = 2")
    machine.each do |s|
      options << "<option value=#{s.id}>#{s.machineId}</option>"
    end
    
    render :text => options
  end
end
