Rails.application.routes.draw do
devise_for :users
resources :moorings, only: [:index, :new, :create, :show]
resources :harbors, only: [:index, :new, :create, :show]
resources :reservations, only: [:index, :new]

root 'home#index'
end
