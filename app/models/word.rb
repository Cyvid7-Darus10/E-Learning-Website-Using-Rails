class Word < ApplicationRecord
    belongs_to :category
    has_many :choices
    has_many :answers, through: :choices
end
