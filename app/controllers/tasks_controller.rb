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
    @work_tasks = Task.where(state: 1)
    @qa_tasks = Task.where(state: 2)
    @approved_tasks = Task.where(state: 3)
    @dropped_tasks = Task.where(state: 4)
  end
 
  def edit
    @task = Task.find(params[:id])
    @task_collection = @task.state_transitions.map{ |transition| [transition.to_name, transition.to] }.push([@task.state_name, @task.state])
  end
  
  def update 
    Task.find(params[:id]).update_attributes(task_params)
    redirect_to action: :index 
  end
  
  def destroy 
    Task.find(params[:id]).delete
    redirect_to action: :index 
  end
  private
  def task_params 
    params.require(:task).permit(:title, :description, :rating, :state)
  end
end