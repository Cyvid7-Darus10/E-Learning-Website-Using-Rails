class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:id])
    if current_user.follow(@user)
      flash[:success] = "You are now following #{@user.name}."
    else
      flash[:danger] = "There was a problem following #{@user.name}."
    end

    redirect_to request.referrer
  end

  def destroy
    @user = User.find(params[:id])
    if current_user.unfollow(@user)
      flash[:success] = "You are no longer following #{@user.name}."
    else
      flash[:danger] = "There was a problem unfollowing #{@user.name}."
    end

    redirect_to request.referrer
  end
end
