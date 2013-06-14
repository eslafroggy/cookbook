class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def show
    @user = User.find(params[:id])
  end
end
