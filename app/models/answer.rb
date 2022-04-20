class Answer < ApplicationRecord
  belongs_to :choice, dependent: :destroy
  belongs_to :lesson, dependent: :destroy
  belongs_to :word, dependent: :destroy
end
