class Word < ApplicationRecord
  belongs_to :category
  has_many   :choices, dependent: :destroy
  has_many   :answers, dependent: :destroy
  validates  :content, presence: true
  accepts_nested_attributes_for :choices
end