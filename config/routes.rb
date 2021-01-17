Rails.application.routes.draw do
  resources :products
  resources :categories

  #devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:edit, :update] 

  root 'home#index'
  get 'home/admin', to: 'home#admin', as: 'homeadmin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end