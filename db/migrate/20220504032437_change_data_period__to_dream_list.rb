class ChangeDataPeriodToDreamList < ActiveRecord::Migration[6.1]

  def up
    change_column :dream_lists, :period, :date, using: "period::date"
  end

  def down
    change_column :dream_lists, :period, :string
  end
end
