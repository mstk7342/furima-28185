Rails.application.routes.draw do
  devise_for :users
  get 'items/new'
  post 'items/new'
  root to: 'items#index'
  resources :articles
  resources :items, only: [:index, :new, :create]
end
