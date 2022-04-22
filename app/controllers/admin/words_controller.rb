class Admin::WordsController < ApplicationController
  def index
    @category = Category.find_by_id(params[:category_id])
    @words = @category.words.paginate(page: params[:page], per_page: 9).order(created_at: :desc)
  end

  def new
    @category = Category.find_by_id(params[:category_id])
    @word = @category.words.new
  end
end
