class ApplicationController < ActionController::Base
  include SessionsHelper

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def authorized_user
    unless current_user && current_user.is_admin?
      flash[:danger] = "You are not authorized to perform this action."
      redirect_to root_path
    end
  end
end
