class RanchstaffsController < ApplicationController
  class TasksController < ApplicationController
  before_action :set_ranch
  before_action :set_task, except: [:create]

  def create 
    @task = @staff.ranchstaffs.create(ranchstaff_params)
    if @ranchstaff.save
      
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
    redirect_to @ranch
  end 

  def undone
    @task.update(done: false)
    redirect_to @ranch
  end

  def star
    @task.update(star: true)
    redirect_to @ranch
  end 

  def unstar
    @task.update(star: false)
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
end
