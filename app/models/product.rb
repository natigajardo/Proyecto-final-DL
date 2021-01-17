class Product < ApplicationRecord
    has_and_belongs_to_many :categories
    has_many_attached :images, dependent: :destroy


    
end
