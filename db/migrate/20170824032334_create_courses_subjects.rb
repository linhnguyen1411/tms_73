class CreateCoursesSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :courses_subjects do |t|
      t.integer :courses_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
