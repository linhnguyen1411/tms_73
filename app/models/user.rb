class User < ApplicationRecord
  has_many :user_courses
  has_many :user_tasks
  has_many :reports
  has_many :user_subjects
  has_many :courses, through: :user_courses
  has_many :tasks, through: :users_tasks
end
