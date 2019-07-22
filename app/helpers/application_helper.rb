module ApplicationHelper 
  def display_due_date(task) 
    if task.due_date != nil
      task.due_date.strftime("%B %d, %Y")
    else
      return "No due date"
    end
  end
end
