Rails.application.routes.draw do
  root "articles#index"
  resources :comments
  resources :articles
end
