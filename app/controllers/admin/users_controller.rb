class Admin::UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 9).order('name ASC')
  end
end
