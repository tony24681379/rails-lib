json.array!(@problem_categories) do |problem_category|
  json.extract! problem_category, :id, :problem
  json.url problem_category_url(problem_category, format: :json)
end
