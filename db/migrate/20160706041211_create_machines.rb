class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines, id: false do |t|
      t.string :branch, null: false
      t.string :place, null: false
      t.string :maintain_group_id, null: false
      t.integer :floor, null: false
      t.string :machine_id, null: false

      t.timestamps
    end
    
    add_index :machines, :machine_id, unique: true
  end
end
