Rails.application.routes.draw do
  
  root to: 'books#index'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions
  resources :loans
  resources :copies
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
