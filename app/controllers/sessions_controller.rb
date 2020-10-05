class SessionsController < ApplicationController
  def login
    @users = User.all
  end

  def logout
    session.destroy
    flash[:notice] = 'Successfully logged out'
    redirect_to root_path
  end

  def authenticate_user
    @user = User.find(params[:id])

    if @user.nil?
      flash[:notice] = 'This name is not registered'
      redirect_to login_path
    else
      session[:current_user_id] = @user.id
      session[:current_username] = @user.name
      flash[:notice] = 'User Logged in'
      redirect_to root_path
    end
  end
end
