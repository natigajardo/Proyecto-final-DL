#include SendGrid

class HomeController < ApplicationController

  def index
  end

  def admin
    @products = Product.all.order("created_at desc")
    @users = User.where(role: 'admin')
    @users1 = User.where(role: 'user')
    @orders = Order.all
    @users_day = User.where(role: 'user').group_by_day(:created_at).count
    @orders_state = Order.all.group(:state).count
    @orders_pendientes_by_date = Order.where(state: 'Pendiente').group_by_day(:created_at).count
    @orders_accept_by_date = Order.where(state: 'Aceptada').group_by_day(:created_at).count
  end

  def paneluser
    @orders = current_user.orders.all
  end 

  #def send_email
  #  require 'mailgun-ruby'
#
  #    # First, instantiate the Mailgun Client with your API key
  #    mg_client = Mailgun::Client.new ENV['API_KEY_MAILGUN']
#
  #    # Define your message parameters
  #    message_params =  { from: 'natty.gajardo.s@gmail.com',
  #                        to:   'natig.artwork@gmail.com',
  #                        subject: 'Prueba mailgun',
  #                        text:    'Esta es una prueba de correo ! '
  #                      }
#
  #    # Send your message through the client
  #    mg_client.send_message 'natty.gajardo.s@gmail.com', message_params
  #end


end
