class TasksController < ApplicationController
  before_action :set_ranch

  def create 
    @task = @ranch.tasks.create(task_params)
    redirect_to @ranch
  end 

  def destroy 
    @task = @ranch.tasks.find(params[:id])
    if @task.destroy
      flash[:success] = "The task was deleted "
    else 
      flash[:success] = "The task was not deleted "
    end 
    redirect_to @ranch
  end 

private

  def task_params
    params[:task].permit(:content)
  end

  def set_ranch 
    @ranch = Ranch.find(params[:ranch_id])
  end 

end

