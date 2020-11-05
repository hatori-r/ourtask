class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :state
      t.string :task
      t.integer :user_id
      t.date :limit_date
      t.timestamps
    end
  end
end
