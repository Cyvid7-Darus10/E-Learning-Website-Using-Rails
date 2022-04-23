class Admin::UsersController < ApplicationController
  before_action :authorized_user

  def index
    if params[:id]
      update_to_admin(params[:id])
    else
      @users = User.paginate(page: params[:page], per_page: 9).order('name ASC')
    end
  end

  private
  def update_to_admin(id)
    @user = User.find_by(id: id)
    if @user && !@user.is_admin?
      @user.update_attribute(:is_admin, 1)
      flash[:success] = "Succesfully promoted user to admin."
    elsif @user && @user.is_admin?
      @user.update_attribute(:is_admin, 0)
      flash[:success] = "Succesfully demoted user."
    else
      flash[:danger] = "User does not exist."
    end
    redirect_to admin_users_path
  end
end
