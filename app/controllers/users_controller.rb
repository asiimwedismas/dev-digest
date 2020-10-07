class UsersController < ApplicationController
  include ApplicationHelper
  include SessionsHelper

  def new
    @user = User.new
  end

  def show
    user = User.find(params[:id])
    @articles = user.articles.includes(:categories)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      find_user(@user)
    else
      render :new
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name)
  end
end
