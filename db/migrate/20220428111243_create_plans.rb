class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.integer :user_id ,null: false
      t.string :title
      t.text :content
      t.datetime :start_time
      t.timestamps
    end
  end
end
