Rails.application.routes.draw do
  devise_for :users
  root 'sweets#index'
  resources :users, only: [:show]
  resources :sweets, only: [:index, :new, :create, :show] do
    resources :likes, only: [:create, :destroy]
  end
end
