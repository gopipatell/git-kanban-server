class UsersController < ApplicationController

  # before_action :authenticate_user, :except => [:create, :index, :show]
  def index
    users = User.all
    render :json => users

  end

  def create
  end

  def show
    @user = User.find(params[:id])
    render formats: :json
  end

  def update
  end

  def destroy
  end
end
