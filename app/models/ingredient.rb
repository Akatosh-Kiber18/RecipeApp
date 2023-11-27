class Ingredient < ApplicationRecord
  belongs_to :recipe
  validates :name, presence: true
  validates :weight, presence: true
end
