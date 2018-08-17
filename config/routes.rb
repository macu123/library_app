Rails.application.routes.draw do
  
  root to: 'books#index'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :loans, only: [:index] do
    member do
      post '/checkin', to: 'loans#checkin'
    end
  end
  resources :copies, only: [:index, :show]
  resources :books, except: [:destroy] do
    member do
      post '/checkout', to: 'books#checkout'
      post '/add_copy', to: 'books#add_copy'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
