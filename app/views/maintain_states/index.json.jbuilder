json.array!(@maintain_states) do |maintain_state|
  json.extract! maintain_state, :id, :state
  json.url maintain_state_url(maintain_state, format: :json)
end
