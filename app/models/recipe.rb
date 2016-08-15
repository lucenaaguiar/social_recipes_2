class Recipe < ApplicationRecord
  validates :name, :cuisine_id, :food_type, :ingredients, :directions,
            presence: true

  has_attached_file :photo, styles: { medium: '400x400>', thumb: '150x150>' },
                            default_url: '/images/:style/missing.png'
  validates_attachment_content_type :photo, content_type: %r{\Aimage\/.*\Z}

  belongs_to :cuisine
  belongs_to :food_type
end
