class Lesson < ApplicationRecord
  has_many   :answers, dependent: :destroy
  has_many   :choices, through: :answers
  has_many   :words, through: :answers
  belongs_to :user 
  belongs_to :category

  def next_word
    (category.words - words).first
  end

  def get_score
    choices.where(is_correct: true).count
  end
end
