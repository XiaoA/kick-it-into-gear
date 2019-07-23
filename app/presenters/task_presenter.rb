class TaskPresenter < ApplicationPresenter

  def display_due_date
    return "No due date" unless @model.due_date
    @model.due_date.strftime("%B %d, %Y")
  end
end
