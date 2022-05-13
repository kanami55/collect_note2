class CreateNotToDoLists < ActiveRecord::Migration[6.1]
  def change
    create_table :not_to_do_lists do |t|
      t.string :work
      t.string :life
      t.string :relationships

      t.timestamps
    end
  end
end
