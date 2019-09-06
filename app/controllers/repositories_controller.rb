class RepositoriesController < ApplicationController
  def index
    @repositories = Repository.all
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
