Rails.application.routes.draw do
  root to: 'toppages#index'

  # session
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # users
  get 'signup',    to: 'users#new'
  resources :users, only: [:show, :new, :create]

  # items
  resources :items, only: [:show, :new]

  # ownerships
  resources :ownerships, only: [:create, :destroy]

  # ranking
  get 'rankings/want', to: 'rankings#want'
  get 'rankings/have', to: 'rankings#have'
end