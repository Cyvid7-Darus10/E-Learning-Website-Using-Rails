class LessonsController < ApplicationController
  before_action :logged_in_user
  
  def index
  end

  def create
    @lesson = Lesson.new(category_id: params[:category_id], user_id: current_user.id)
    if @lesson.save
      flash[:success] = "Your lesson has been created."
      redirect_to new_lesson_answer_path(@lesson)
    else
      flash[:danger] = "Your lesson could not be created."
      redirect_to categories_path
    end
  end

  def show
    @lesson = Lesson.find_by_id(params[:id])
  end
end
