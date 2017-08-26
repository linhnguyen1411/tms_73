class Task < ApplicationRecord
  has_many :users_tasks
  has_many :users, through: :users_tasks
  belongs_to :subject
end
