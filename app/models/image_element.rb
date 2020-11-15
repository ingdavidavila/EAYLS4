class ImageElement < ApplicationRecord
  belongs_to :articulo
  has_one_attached :image
end
