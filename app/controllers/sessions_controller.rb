class SessionsController < ApplicationController

  def new     # display login form
    @user = User.new
  end

  def create  # login user into session
    if @user = User.authenticate(params[:user])
      session[:user_id] = @user.user_id
    else
      redirect_to login_path, :error => "bad credentials"
    end
  end

  def destroy
    # logout user from session
  end

end