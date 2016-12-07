class TasksController < ApplicationController
  before_action :set_ranch
  before_action :set_task, except: [:create]

  def create 
    @task = @ranch.tasks.create(task_params)
    if @task.save
      @task.update(done: false)
      flash[:success] = "The task was created "
    else 
      flash[:success] = "The task was not created "
    end
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
    flash[:success] = "The task was executed "
    redirect_to @ranch
  end 

  def undone
    @task.update(done: false)
    flash[:success] = "The task was unexecuted "
    redirect_to @ranch
  end

  def star
    @task.update(star: true)
    flash[:success] = "The task was marked as important"
    redirect_to @ranch
  end 

  def unstar
    @task.update(star: false)
    flash[:success] = "The task was unmarked as important "
    redirect_to @ranch
  end 

private

  def task_params
    params[:task].permit(:content, :date, :assigned_to)
  end

  def set_ranch 
    @ranch = Ranch.find(params[:ranch_id])
  end 

  def set_task 
    @task = @ranch.tasks.find(params[:id])
  end 

end

