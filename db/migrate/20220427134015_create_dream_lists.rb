class CreateDreamLists < ActiveRecord::Migration[6.1]
  def change
    create_table :dream_lists do |t|
      t.string :dream, null: false
      t.string :period, null: false
      t.text :detail
      t.string :category, null: false

      t.timestamps
    end
  end
end
