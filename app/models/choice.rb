class Choice < ApplicationRecord
  has_many   :answers, dependent: :destroy
  belongs_to :word
  validates  :content, presence: true
end
