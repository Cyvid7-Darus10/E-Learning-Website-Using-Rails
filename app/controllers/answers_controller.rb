class AnswersController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @answers = Answer.new
  end
end
