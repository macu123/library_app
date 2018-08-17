Rails.application.routes.draw do
  
  get 'loans/index'
  root to: 'books#index'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions
  resources :loans
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
