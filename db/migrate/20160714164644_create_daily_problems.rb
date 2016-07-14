class CreateDailyProblems < ActiveRecord::Migration
  def change
    create_table :daily_problems do |t|
      t.date :date
      t.string :machine_id
      t.string :user_id
      t.string :problem_detail
      t.integer :situation
      t.string :maintainer_id
      t.string :comment

      t.timestamps null: false
    end
  end
end
