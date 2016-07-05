class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :place
      t.string :group
      t.integer :floor
      t.string :machine_name

      t.timestamps
    end
  end
end
