class HomeController < ApplicationController
  def index
  end

  def admin
    @products = Product.all.order("created_at desc")
    @users = User.where(role: 'admin')
    @users1 = User.where(role: 'user')
    @orders = Order.all
  end

  def paneluser
    @orders = current_user.orders.all
  end 

end
