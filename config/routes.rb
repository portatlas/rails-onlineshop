Rails.application.routes.draw do

  root 'products#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/checkout' => 'carts#checkout'

  resources :products
  resources :admin
  resources :orders
  resources :categories
  resources :users
  resource :cart, only: [:show]
  resources :product_orders, only: [:create, :update, :destroy]

end
