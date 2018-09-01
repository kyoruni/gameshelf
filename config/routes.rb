Rails.application.routes.draw do
  root to: 'toppages#index'

  # users
  get 'signup',    to: 'users#new'
  resources :users, only: [:show, :new, :create]

  # session
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # items
  resources :items, only: [:new]
end