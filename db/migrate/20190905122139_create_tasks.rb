class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :repository_id
      t.text :description
      t.string :status
      t.date :due_date
      t.integer :task_index

      t.timestamps
    end
  end
end
