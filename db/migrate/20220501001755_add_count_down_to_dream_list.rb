class AddCountDownToDreamList < ActiveRecord::Migration[6.1]
  def change
    add_column :dream_lists, :countdown, :datetime
  end
end
