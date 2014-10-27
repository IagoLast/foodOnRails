Rails.application.routes.draw do
  resources :recipes

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
