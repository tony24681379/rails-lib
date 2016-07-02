json.array!(@dailies) do |daily|
  json.extract! daily, :id, :date, :machine_id, :state
  json.url daily_url(daily, format: :json)
end
