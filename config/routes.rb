Rails.application.routes.draw do
  devise_for :users
  root 'sweets#index'
  resources :users, only: [:show]
  resources :sweets, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
    end
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
end
