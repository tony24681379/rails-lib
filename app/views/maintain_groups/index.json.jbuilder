json.array!(@maintain_groups) do |maintain_group|
  json.extract! maintain_group, :id, :group, :user_id
  json.url maintain_group_url(maintain_group, format: :json)
end
