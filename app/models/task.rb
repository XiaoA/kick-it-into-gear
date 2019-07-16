class Task < ApplicationRecord
  enum status: { todo: 0, done: 1, waitiing: 2, canceled: 3 }
  validates_presence_of :title
end
