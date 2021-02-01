class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  #Cancelar orden
  def cancel_order 
    sleep 2
    order_id = params[:order_id]
    @cancel_order = Order.find(order_id)
    @cancel_order.state = "Cancelada"
    respond_to do |format|
      if @cancel_order.save
        format.js
      end 
    end
    @orders = Order.all   
  end

  #-----------------------------------------
   # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to homeadmin_path }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
    if @order.state == "Aceptada"
      @order.order_items.each do |item|
        @product = item.product
        if @product.stock > 0 
          @product.stock -= item.quantity
          @product.save 
          item.save 
        else 
          redirect_to homeadmin_path, notice: "No queda stock"
        end
      end
    end 
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:number, :total, :state, :user_id)
    end

    def set_current_order 
      @order = current_order 
    end
end
