json.array!(@machines) do |machine|
  json.extract! machine, :id, :place, :floor, :machine_name
  json.url machine_url(machine, format: :json)
end
