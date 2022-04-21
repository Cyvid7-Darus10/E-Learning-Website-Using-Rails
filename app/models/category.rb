class Category < ApplicationRecord
  has_many :words, dependent: :destroy
  has_many :lessons, depedent: :destroy
end
