class CategoriesController < ApplicationController
  def index
    @filter = ''
    if params[:filter]
      @filter = params[:filter]
    end

    @categories = Category.paginate(page: params[:page], per_page: 6).order(created_at: :desc)

    if @filter == "learned"
      # Get the learned categories
    elsif @filter == "not_learned"
      # Get the not learned categories
    end

  end
end
