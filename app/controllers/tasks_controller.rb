class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :mark_completed]

  def index
    @tasks = Task.all
  
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to action: :index, notice: "Your task was created."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Your task was updated.'
    else
      render :edit 
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Your task was deleted.'
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :due_date)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
