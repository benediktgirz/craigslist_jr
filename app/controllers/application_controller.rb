class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    return nil unless logged_in?
    @current_user ||= User.find( session[:user_id] )
  end

  def logged_in?
    session[:user_id].present?
  end

  helper_method :current_user, :logged_in?

  def enforce_login
    redirect_to login_path, :notice => "You must log in to access that page" unless current_user
  end

end
