class CreateDailyProblems < ActiveRecord::Migration
  def change
    create_table :daily_problems do |t|
      t.date :date
      t.integer :machine_id
      t.string :user_id
      t.integer :problem_category
      t.string :problem_detail
      t.string :maintainer_id
      t.integer :situation
      t.string :comment

      t.timestamps
    end
  end
end
