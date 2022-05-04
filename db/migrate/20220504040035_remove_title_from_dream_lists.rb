class RemoveTitleFromDreamLists < ActiveRecord::Migration[6.1]
  def change
    remove_column :dream_lists, :countdown, :datetime
  end
end
