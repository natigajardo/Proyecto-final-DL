#include SendGrid

class HomeController < ApplicationController

  def index
  end

  def admin
    @products = Product.all.order("created_at desc")
    @users = User.where(role: 'admin').order("created_at desc")
    @users1 = User.where(role: 'user').order("created_at desc")
    @orders = Order.all.order("created_at desc")
    
    #Gráficos
    @users_day = User.where(role: 'user').group_by_day(:created_at).count
    @orders_state = Order.all.group(:state).count
    @orders_pendientes_by_date = Order.where(state: 'Pendiente').group_by_day(:created_at).count
    @orders_accept_by_date = Order.where(state: 'Aceptada').group_by_day(:created_at).count
  end

  def paneluser
    @orders = current_user.orders.all
  end 

end
