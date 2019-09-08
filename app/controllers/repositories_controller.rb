class RepositoriesController < ApplicationController

  before_action :authenticate_user!

  def index
    @repositories = Repository.find_by_user_id @current_user.id
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
end
