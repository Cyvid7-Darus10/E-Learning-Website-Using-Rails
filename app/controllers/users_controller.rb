class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :edit, :create]
  before_action :correct_user, only: [:edit, :update]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      flash[:success] = "Welcome, #{@user.name}!"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your profile was successfully updated."
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def user_params
    if params[:user][:image]
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
    else
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end

  def correct_user
    user = User.find(params[:id])
    if user != current_user
      flash[:danger] = "You are not authorized to perform this action."
      redirect_to root_path
    end
  end

end
