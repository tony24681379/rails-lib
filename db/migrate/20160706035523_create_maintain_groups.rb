class CreateMaintainGroups < ActiveRecord::Migration
  def change
    create_table :maintain_groups, id: false do |t|
      t.string :group, null: false
      t.string :user_id

      t.timestamps
    end
    add_index :maintain_groups, :group, unique: true
  end
end
