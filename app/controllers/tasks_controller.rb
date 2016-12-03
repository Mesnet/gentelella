class TasksController < ApplicationController
  before_action :authenticate_user
  before_action :find_task, only: [:edit, :delete]
  
  def index 
    @pins = Pin.all.order("RANDOM()")
  end 

  def new
   @task = Task.new
  end

  def create 
    @task = current_user.tasks.build(task_params)
  end 

  def destroy
    @pin.destroy
  end

  private

  def task_params
    params.require(:task).permit(:content, :date, :split, :star, :user_id)
  end  

  def find_task
    @task = Task.find(params[:id])
  end 
end
