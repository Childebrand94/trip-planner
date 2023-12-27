Rails.application.routes.draw do
  root 'home#home'
  resources :users do
    get 'edit_password', to: 'users#edit_password'
    patch 'update_password', to: 'users#update_password'
  end
  resources :invites

  resources :trips do
    resources :expenses
    resources :debtors
    resources :itinerary_items, path: 'itinerary' do
      resources :comments
      post 'vote', to: 'itinerary_votes#vote'
    end
    get 'day/:date', to: 'trips#day', as: :trip_day
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
