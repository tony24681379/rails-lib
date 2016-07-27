json.array!(@user_states) do |user_state|
  json.extract! user_state, :id, :state
  json.url user_state_url(user_state, format: :json)
end
