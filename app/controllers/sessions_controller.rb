class SessionsController < ApplicationController
  include SessionsHelper
  def login
    @users = User.all
  end

  def logout
    session.destroy
    flash[:notice] = 'Successfully logged out'
    redirect_to root_path
  end

  def authenticate_user
    find_user(User.find(params[:id]))
  end
end
