class UsersController < ApplicationController
  include ApplicationHelper

  def new
    @user = User.new
  end

  def show
    user = User.find(params[:id])
    @articles = user.articles.includes(:categories)
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name)
  end
end
