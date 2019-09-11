class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    tasks = Task.all
    render :json => tasks
  end

  def create
    task = Task.create task_params

    task.task_index = Task.where(:status => task.status, :repository_id => task.repository_id).count
    task.user_id = @current_user.id
    task.save
    render :json => task
  end

  def show
  end

  def update
  end

  def destroy
  end


  private
  def task_params
    params.require(:task).permit(:title, :description, :status, :repository_id)
  end

end
