class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column(:daily_problems, :situation, :string)
  end
end
