class Recipe < ApplicationRecord
  validates :name, :cuisine_id, :food_type, :ingredients, :directions,
            presence: true

  belongs_to :cuisine
  belongs_to :food_type
end
