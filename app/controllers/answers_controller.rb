class AnswersController < ApplicationController
  def new
    @lesson = Lesson.find_by_id(params[:lesson_id])
    @category = @lesson.category

    if @lesson.next_word.nil?
      flash[:success] = "Congratulations! You have learned all words in #{@category.title}." 

      @lesson.update(score: @lesson.get_score)
      redirect_to lesson_path(@lesson)
    else
      @answer = Answer.new
      @word = @lesson.next_word
    end
  end

  def create
    @lesson = Lesson.find_by_id(params[:lesson_id])
    @answer = Answer.new(answer_params)
    @answer.lesson_id = @lesson.id
    @word = @lesson.next_word
    if @answer.save
      flash[:success] = "Your answer has been saved."
      redirect_to new_lesson_answer_path(@lesson)
    else
      flash[:danger] = "Your answer could not be saved."
      redirect_to new_lesson_answer_path(@lesson)
    end
  end 

  private
  def answer_params
    params.require(:answer).permit(:word_id, :choice_id)
  end
end
