class Product < ApplicationRecord
    has_and_belongs_to_many :categories
    has_many_attached :images, dependent: :destroy
    has_many :order_items
    has_many :orders, through: :order_items

    validates :name, :sku, :author, :description, :dimension, :price, presence: true 
    validates :description, length: { maximum: 1000, too_long: "%{count} carácteres es el máximo permitido." }
    validates :name, length: {maximum: 150, too_long: "%{count} carácteres es el máximo permitido."}
    validates :price, length: { maximum: 7 }
    validates :sku, uniqueness: true 

end
