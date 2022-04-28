class CategoriesController < ApplicationController
  def index
    @filter = params[:filter] ? params[:filter] : ""
    @lessons = Lesson.where(user_id: current_user.id)
    
    if @filter == "learned"
      @categories = Category.where(id: @lessons.pluck(:category_id))
    elsif @filter == "not_learned"
      @categories = Category.where.not(id: @lessons.pluck(:category_id))
    else
      @categories = Category.all
    end

    @categories = @categories.paginate(page: params[:page], per_page: 6).order(created_at: :desc)
  end
end
