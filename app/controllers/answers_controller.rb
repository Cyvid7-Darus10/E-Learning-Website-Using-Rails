class AnswersController < ApplicationController
  def new
    @category = Category.first
    @answer = Answer.new
  end
end
