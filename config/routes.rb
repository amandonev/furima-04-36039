Rails.application.routes.draw do

  root to: 'items#index'
  resources :items, only: :index
  
  devise_for :users
  
end
