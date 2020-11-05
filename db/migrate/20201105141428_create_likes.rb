class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id, foreign_key: true
      t.integer :task_id, foreign_key: true

      t.timestamps

      t.index :user_id
      t.index :task_id
      t.index [:user_id, :task_id], unique: true
    end
  end
end
