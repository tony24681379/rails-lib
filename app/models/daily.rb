class Daily < ActiveRecord::Base
  has_one :user
  has_one :machine
  has_one :problem_category
end
