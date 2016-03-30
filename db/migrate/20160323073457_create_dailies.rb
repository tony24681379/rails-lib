class CreateDailies < ActiveRecord::Migration
  def change
    create_table :dailies do |t|
      t.integer :floor
      t.integer :machineId
      t.string :userId
      t.integer :problemCategory
      t.string :problemDetail
      t.date :date
      t.string :comment
      t.string :maintainerId
      t.integer :situation

      t.timestamps
    end
  end
end
