Rails.application.routes.draw do
  root "articles#index"
  get "/login",   to: "sessions#new"
  post "/login",  to: "sessions#create"
  get "/signup",  to: "users#new"
  post "/signup", to: "users#create"
  delete "/logout", to: "sessions#destroy"

  resources :articles do
    resources :comments, only: [:create, :new]
  end

  resources :comments, only: [:create, :new] do
    resources :comments, only: [:create, :new]
  end

  resources :users, only: [:new, :create, :edit, :update]
end
