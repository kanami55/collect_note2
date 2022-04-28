class AddUserIdToDreamLists < ActiveRecord::Migration[6.1]
  def change
    execute 'DELETE FROM dream_lists;'
    add_reference :dream_lists, :user, forign_key: true
  end
end
