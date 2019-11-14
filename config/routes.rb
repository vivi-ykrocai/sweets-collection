Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sweets, only: [:index, :show]
  root 'sweets#index'
end
