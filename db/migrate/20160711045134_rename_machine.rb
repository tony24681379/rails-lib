class RenameMachine < ActiveRecord::Migration
  def change
    rename_column :machines, :maintain_group_id, :maintain_group
  end
end
