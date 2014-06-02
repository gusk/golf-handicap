class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by email: params[:user][:email].downcase

    if user.present? && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(current_user.id)
    else
      @user = User.new
      flash[:email_error] = 'Incorrect Email or Password'
      render new_session_path, flash: {:login_failure => "Invalid email or password"}
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end