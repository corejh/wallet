Wallet::Application.routes.draw do
  devise_for :users do
    get "/login", to: "devise/sessions#new", as: :login
    get "/register", to: "devise/registrations#new", as: :register 
    get "/logout", to: "devise/sessions#destroy", as: :logout
  end
  get "/profile", to: "users#show", as: :profile

  resources :accounts, only: [:new, :create, :show]
  resources :transactions, only: [:new, :create]

  root 'application#index'
  
end
