class Articulo < ApplicationRecord
    belongs_to :user
    validates :titulo, presence: true, length: {minimum: 6, maximum: 100}
    validates :cuerpo, presence: true, length: {minimum: 10, maximum: 30000}
    has_one_attached :image_element
    before_save {self.categoria = categoria.downcase}

    def self.search(search)
        where("lower(articulo.titulo) LIKE :search", search: "%#{search.downcase}%").uniq
    end
end
