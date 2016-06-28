class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.text :place
      t.integer :floor
      t.text :machine_name

      t.timestamps
    end
  end
end
