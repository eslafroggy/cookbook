class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:notice] = "Your email or password was not correct"
      render :new
  end

  def destroy
    session[:user_id] = id
    redirect_to root_path, :notice => "You're logged out"
  end
end
end
