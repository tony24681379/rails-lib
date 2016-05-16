class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.integer :floor
      t.text :machineId

      t.timestamps
    end
  end
end
