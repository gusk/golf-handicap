class UsersController < ApplicationController

  layout 'user_profile'


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  @user = current_user
  end

  def create
    @user = User.create(
      first_name: params[:user][:first_name],
      last_name: params[:user][:last_name],
      email: params[:user][:email],
      password: params[:user][:password])
    # password_confirmation: params[:user][:password_confirmation]
    if @user.save
      redirect_to root_path
    else
      render 'users/new'
    end
  end
end