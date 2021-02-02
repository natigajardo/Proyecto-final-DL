Rails.application.routes.draw do
  resources :order_items
  resources :orders
  get 'cart', to: 'cart#show'
  get 'bought/:order_item_id', to: 'order_items#bought', as: 'bought_item'
  get 'cancel_order/:order_id', to: 'orders#cancel_order', as: 'cancel_order'

  resources :products
  resources :categories
  
  #devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:edit, :update] 

  root 'home#index'
  get 'home/admin', to: 'home#admin', as: 'homeadmin'
  get 'home/paneluser', to: 'home#paneluser', as: 'paneluser'

  #MAILGUN
  #get '/send_email', to: 'home#send_email', as: 'send_email'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
