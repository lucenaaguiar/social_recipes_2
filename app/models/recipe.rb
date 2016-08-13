class Recipe < ApplicationRecord
  validates :name, :cuisine, :food_type, :ingredients, :directions,
            presence: true
end
