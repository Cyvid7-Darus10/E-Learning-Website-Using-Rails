class Answer < ApplicationRecord
  has_one :choice, dependent: :destroy
  has_one :lesson, dependent: :destroy
  has_one :word, dependent: :destroy
end
