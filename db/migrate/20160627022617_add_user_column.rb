class AddUserColumn < ActiveRecord::Migration
  def change
    add_column :users, :extension_number, :integer
  end
end
