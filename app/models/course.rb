class Course < ApplicationRecord
  has_many :courses_subjects
  has_many :user_courses
  has_many :users, through: :user_courses
  has_many :subjects, through: :courses_subjects
end
