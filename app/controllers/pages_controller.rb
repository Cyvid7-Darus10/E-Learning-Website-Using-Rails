class PagesController < ApplicationController
  before_action :logged_in_user, only: [:dashboard]
  
  def home
  end

  def about
  end

  def contact
  end

  def dashboard
    @activities = Activity.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
  end
end
