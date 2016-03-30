json.array!(@dailies) do |daily|
  json.extract! daily, :id, :floor, :machineId, :userId, :problemCategory, :problemDetail, :date, :comment, :maintainerId, :situation
  json.url daily_url(daily, format: :json)
end
