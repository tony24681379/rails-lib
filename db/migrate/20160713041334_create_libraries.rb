class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :branch
      t.integer :floor

      t.timestamps null: false
    end
  end
end
