class Lesson < ApplicationRecord
  belongs_to :user 
  belongs_to :category
  has_many   :answers, dependent: :destroy
  has_many   :words, through: :answers
  has_many   :choices, through: :answers
  has_one    :activity, as: :action, dependent: :destroy
  
  after_create :initialize_activity

  def next_word
    (category.words - words).first
  end

  def get_score
    choices.where(is_correct: true).count
  end

  def initialize_activity
    create_activity(user_id: user.id)
  end
end
