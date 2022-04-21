class Word < ApplicationRecord
  belongs_to :category
  has_many   :choices, dependent: :destroy
  has_many   :answers, dependent: :destroy
end