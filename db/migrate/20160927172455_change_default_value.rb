class ChangeDefaultValue < ActiveRecord::Migration
  def change
    change_column_default(:daily_problems, :situation, '待處理')
  end
end
