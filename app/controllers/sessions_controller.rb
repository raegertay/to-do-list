class SessionsController < ApplicationController

  def new
    redirect_to tasklists_path if current_user
  end

  def create
    # byebug
    redirect_to tasklists_path and return if current_user
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tasklists_path
    else
      flash[:alert] = 'Username or password is invalid'
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have successfully logout'
    redirect_to root_path
  end

end
