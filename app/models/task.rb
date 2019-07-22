class Task < ApplicationRecord
  belongs_to :user

  enum status: { todo: 0, waiting: 1, done: 2, canceled: 3h }
  validates_presence_of :title
end
