class TasksController < ApplicationController
  def new
    @task = Task.new
  end
 
  def create
    Task.create task_params
    render :index 
  end
  def index
  end
  private
  def task_params 
    params.require(:task).permit(:title, :description, :rating)
  end
end