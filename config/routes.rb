Rails.application.routes.draw do
  get 'cart', to: 'cart#show'

  resources :order_items
  get 'bought/:order_item_id', to: 'order_items#bought', as: 'bought_item'
  resources :products
  resources :categories

  #devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:edit, :update] 

  root 'home#index'
  get 'home/admin', to: 'home#admin', as: 'homeadmin'
  get 'home/paneluser', to: 'home#paneluser', as: 'paneluser'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
