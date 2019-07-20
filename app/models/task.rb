class Task < ApplicationRecord
  belongs_to :user

  enum status: { todo: 0, done: 1, waiting: 2, canceled: 3 }
  validates_presence_of :title

                        
end
