class Task < ApplicationRecord
  belongs_to :user

  enum status: { Todo: 0, Waiting: 1, Done: 2, Someday: 3 }
  validates_presence_of :title
end
