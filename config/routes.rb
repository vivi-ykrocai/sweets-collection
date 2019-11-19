Rails.application.routes.draw do
  devise_for :users
  root 'sweets#index'
  resources :sweets, only: [:index, :new, :create, :show]
  resources :users, only: [:show]
end
