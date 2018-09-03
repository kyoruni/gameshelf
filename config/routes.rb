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
  resources :ownerships, only: [:create, :destroy]
end