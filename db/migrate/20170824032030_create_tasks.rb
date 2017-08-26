class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.float :time
      t.text :description
      t.integer :subject_id

      t.timestamps
    end
  end
end
