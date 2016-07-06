json.array!(@machines) do |machine|
  json.extract! machine, :id, :branch, :place, :maintain_group_id, :floor, :machine_id
  json.url machine_url(machine, format: :json)
end
