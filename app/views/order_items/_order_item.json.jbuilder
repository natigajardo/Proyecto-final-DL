json.extract! order_item, :id, :quantity, :unit_price, :subtotal, :order_id, :product_id, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)
