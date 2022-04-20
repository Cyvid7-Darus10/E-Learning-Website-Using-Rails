class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(page: params[:page], per_page: 9).order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end
end
