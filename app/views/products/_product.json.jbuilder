json.extract! product, :id, :sku, :name, :author, :description, :dimension, :price, :sold, :created_at, :updated_at
json.url product_url(product, format: :json)
