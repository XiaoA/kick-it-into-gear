class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def index
    @tasks = current_user.tasks.all.order("status ASC")
   end

  def new
    @task = Task.new
     respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @task = current_user.tasks.new(task_params)
    
    if @task.save
      redirect_to root_path, notice: "Your task was created."
    else
      render :new
    end
  end

  def show
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    if @task.update(task_params)
      redirect_to root_path, notice: 'Your task was updated.'
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
