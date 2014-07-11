Rails.application.routes.draw do
devise_for :users
resources :moorings, only: [:index, :new, :create]
resources :harbors, only: [:index, :new, :create, :show]
root 'home#index'
end
