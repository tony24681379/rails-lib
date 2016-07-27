class CreateMaintainStates < ActiveRecord::Migration
  def change
    create_table :maintain_states do |t|
      t.string :state

      t.timestamps null: false
    end
  end
end
