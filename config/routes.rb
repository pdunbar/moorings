Rails.application.routes.draw do
devise_for :users
resources :moorings, only: [:index, :new, :create, :show] do
  resources :reservations, only: [:new, :create]
end
resources :reservations, only: [:index, :show]
resources :harbors, only: [:index, :new, :create, :show]
resources :boats, only: [:index, :new, :create]

root 'home#index'
end
