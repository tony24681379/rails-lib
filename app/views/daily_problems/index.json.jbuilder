json.array!(@daily_problems) do |daily_problem|
  json.extract! daily_problem, :id, :date, :machine_id, :user_id, :problem_category, :problem_detail, :maintainer_id, :situation, :comment
  json.url daily_problem_url(daily_problem, format: :json)
end
