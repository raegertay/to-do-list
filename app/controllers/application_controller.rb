class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def login_check
    unless current_user
      flash[:alert] = 'Please login first'
      redirect_to root_path
    end
  end

end
