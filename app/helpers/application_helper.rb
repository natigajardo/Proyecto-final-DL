module ApplicationHelper

  def current_order
    if current_user
      order = Order.find_or_create_by(user_id: current_user.id, state: 'Creada')
    end
  end

  def cart_count_over_one
    return total_cart_items if total_cart_items > 0
  end

  def total_cart_items
    @order = current_order
    @order_items = @order.order_items
    total = @order_items.collect{|order_item| order_item.valid? ? order_item.quantity : 0}.sum 
    return total if total > 0
  end
  
end
