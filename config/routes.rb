Rails.application.routes.draw do
  root "articles#index"
  resources :comments, only: [:new, :create]
  resources :articles
end
