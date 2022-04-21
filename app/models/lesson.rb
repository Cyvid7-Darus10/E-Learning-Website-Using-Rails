class Lesson < ApplicationRecord
  has_many   :answers, dependent: :destroy
  belongs_to :user 
  belongs_to :category
end
