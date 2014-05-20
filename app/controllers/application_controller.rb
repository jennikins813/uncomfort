class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  #def current_user
  #	@current_user ||= User.find(user_session[:user_id]) if user_session[:user_id]
  #end

  helper_method :current_user

  def require_login
    unless current_user
      flash[:alert] = "Please log in"
      redirect_to new_user_session_path
    end
  end
end
