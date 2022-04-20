class Category < ApplicationRecord
  has_many :words
  belongs_to :lesson
end
