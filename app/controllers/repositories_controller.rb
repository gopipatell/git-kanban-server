class RepositoriesController < ApplicationController

  before_action :authenticate_user!

  def index
    # @repositories = Repository.find_by_user_id @current_user.id
    @repositories = @current_user.repositories

    render formats: :json
  end

  def create
  end

  def show
    @repository = Repository.find(params[:id])
    render formats: :json
  end

  def update
  end

  def destroy
  end

  def update_task_index
    puts "Update called... #{params[:id]}"

    repository_id = params[:id]
    new_index = params[:new_index]
    new_status = params[:new_status]
    task = Task.find params[:task_id]
    original_index = task.task_index

    if task.status == new_status
      move_in_same_column original_index, new_index, task.status, repository_id
    else
      move_in_same_column original_index, 10000, task.status, repository_id
      move_in_same_column 10000, new_index, new_status, repository_id
      task.status = new_status
    end

    task.task_index = new_index
    task.save

  end

  private
  def move_in_same_column original_index, new_index, status, repository_id
    tasks = Task.where(:status => status, :repository_id => repository_id)
    if original_index > new_index
      tasks.each do |t|
        if t.task_index >= new_index && t.task_index < original_index
          t.task_index = t.task_index + 1
          t.save
        end
      end
    else
      tasks.each do |t|
        if t.task_index > original_index && t.task_index <= new_index
          t.task_index = t.task_index - 1
          t.save
        end
      end
    end
  end

end
