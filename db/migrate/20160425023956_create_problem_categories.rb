class CreateProblemCategories < ActiveRecord::Migration
  def change
    create_table :problem_categories do |t|
      t.text :problem

      t.timestamps
    end
  end
end
