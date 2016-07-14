json.array!(@libraries) do |library|
  json.extract! library, :id, :branch, :floor
  json.url library_url(library, format: :json)
end
