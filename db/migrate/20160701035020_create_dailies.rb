class CreateDailies < ActiveRecord::Migration
  def change
    create_table :dailies do |t|
      t.date :date
      t.integer :machine_id
      t.integer :state

      t.timestamps
    end
  end
end
