Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products
  get "/products/search/", to: 'products#search'
  resources :payement_methods
  resources :reviews, only: [:index, :create]
  resources :purchases, only: [:index, :create, :show]
  resources :users, only: [:show, :destroy]

  root 'products#index'

  get "*path", to: 'application#catch_404', via: :all
  post "*path", to: 'application#catch_404', via: :all


end
