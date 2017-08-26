class CreateUsersTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :users_tasks do |t|
      t.integer :task_id
      t.integer :user_id
      t.boolean :status

      t.timestamps
    end
  end
end
