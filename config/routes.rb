Rails.application.routes.draw do
  root 'home#home'
  resources :trips
  resources :users

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
