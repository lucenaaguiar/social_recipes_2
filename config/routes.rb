Rails.application.routes.draw do
  root 'home#index'

  resources :recipes, only: [:new, :create, :show]
  resources :cuisines, only: [:new, :create, :show]
end
