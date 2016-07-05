json.array!(@machines) do |machine|
  json.extract! machine, :id, :place, :group, :floor, :machine_name
  json.url machine_url(machine, format: :json)
end
