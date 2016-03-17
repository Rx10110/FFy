class ChangeColumnStatisfaction < ActiveRecord::Migration
  def up
      change_column :movies, :satisfaction_rate, :float
  end

  def down
      change_column :movies, :satisfaction_rate, :integer
  end
end
