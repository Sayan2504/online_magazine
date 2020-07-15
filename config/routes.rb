Rails.application.routes.draw do
  root "articles#index"

  resources :articles do
    resources :comments, only: [:create, :new]
  end

  resources :comments, only: [:create, :new] do
    resources :comments, only: [:create, :new]
  end
end
