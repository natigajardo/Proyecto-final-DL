class OrderItemsController < ApplicationController
  before_action :set_order
  
  def create
    @order_item = @order.order_items.new(order_item_params)
    @order_item.save 
    session[:order_id] = @order.id 
    redirect_to cart_path
  end

  def update
     @order_item = @order.order_items.find(params[:id])
     @order_item.update_attributes(order_item_params)
     @order_items = current_order.order_items
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy 
    @order_items = curent_order.order_items 
  end

  def bought
    @order.order_items.each do |item|
      @product = item.product
      @product.stock -= item.quantity
      @product.save 
      item.save 
    end
    sleep 4
    @order.state = "Pendiente"
    @order.save 
    redirect_to root_path
  end 

  private 

  def set_order 
    @order = current_order 
  end

  def order_item_params 
    params.require(:order_item).permit(:quantity, :unit_price, :subtotal, :product_id, :order_id)
  end
end
