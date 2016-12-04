class TasksController < ApplicationController
  before_action :set_ranch
  before_action :set_task, except: [:create]

  def create 
    @task = @ranch.tasks.create(task_params)
    @task.update(done: false)
    redirect_to @ranch
  end 

  def destroy 
    if @task.delete
      flash[:success] = "The task was deleted "
    else 
      flash[:success] = "The task was not deleted "
    end 
    redirect_to @ranch
  end 

  def done
    @task.update(done: true)
    @task.update(completed_at: Time.now)
    redirect_to @ranch, notice: "Task done"
  end 

  def undone
    @task.update(done: false)
    redirect_to @ranch, notice: "Task undone"
  end 

private

  def task_params
    params[:task].permit(:content)
  end

  def set_ranch 
    @ranch = Ranch.find(params[:ranch_id])
  end 

  def set_task 
    @task = @ranch.tasks.find(params[:id])
  end 

end

