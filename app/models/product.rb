class Product < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items

  validates :name, :stock, :sku, :size, :brand, presence: true
  validates :price, length: { maximum: 7 }

  BRAND = %w{ Alaniz, Docker, Alisa,  }
  COLOR = %w{ Blanco Negro Azul Rojo Cafe Amarillo  }
  SIZE = %w{ s-small small medium large x-large }
     
  has_one_attached :image
end
