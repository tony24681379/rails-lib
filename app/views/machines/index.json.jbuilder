json.array!(@machines) do |machine|
  json.extract! machine, :id, :floor, :machineId
  json.url machine_url(machine, format: :json)
end
