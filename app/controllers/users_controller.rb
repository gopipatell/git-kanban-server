class UsersController < ApplicationController

  # before_action :authenticate_user, :except => [:create, :index, :show]
  def index
    users = User.all
    render :json => users

  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end
end
