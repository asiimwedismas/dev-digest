class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  # user selects name from list to login
  def index
    @users = User.all
  end

  # GET /users/1
  # show articles created by the user
  def show; end

  # GET /users/new
  # show create or sign up a new user
  def new
    @user = User.new
  end

  # POST /users
  # save new user
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # logout current user
  def logout
    session.destroy
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
      # flash[:notice] = 'User Logged in'
      redirect_to root_path
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name)
  end
end
