class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      login(user)
      flash[:success] = "Welcome back, #{user.name}!"
      redirect_to root_path
    else
      flash[:danger] = "Invalid email or password."
      redirect_to login_url
    end
  end

  def destroy
  end
end
