class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]
  before_action :set_order, only: [:create, :bought]

  def bought
    sleep 2
    @order.state = "Pendiente"
    respond_to do |format|
      if @order.save
        format.html { redirect_to paneluser_path, notice: 'Tu orden está siendo procesada!' }
      end 
    end
  end

  # GET /order_items
  # GET /order_items.json
  def index
    @order_items = OrderItem.all
  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
  end

  # GET /order_items/new
  def new
    @order_item = OrderItem.new
  end

  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items
  # POST /order_items.json
  def create
    #@order_item = @order.order_items
    #product = Product.find(params[:product_id])

    #if @order_item.find_by(product_id: product.id)
    #   @order_item.increment(:quantity)
    #else
      @order_item = @order.order_items.new(order_item_params)
    #end 
  
    respond_to do |format|
      if @order_item.save
        session[:order_id] = @order.id 
        format.html { redirect_to cart_path, notice: 'Order item was successfully created.' }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to @order_item, notice: 'Order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order = Order.find(session[:order_id])
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path, notice: 'Order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_item_params
      params.require(:order_item).permit(:quantity, :unit_price, :subtotal, :order_id, :product_id)
    end

    def set_order 
      @order = current_order 
    end

end
