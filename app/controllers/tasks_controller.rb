class TasksController < ApplicationController
  def new
    @task = Task.new
  end
 
  def create
    Task.create task_params
    redirect_to action: :index 
  end
  
  def index
    @opened_tasks = Task.where(state: 0)
  end
  
  private
  def task_params 
    params.require(:task).permit(:title, :description, :rating)
  end
end