class Lesson < ApplicationRecord
  has_many :categories
  has_many :words, through: :categories
  has_many :choices, through: :words
  has_many :answers, through: :choices
end
