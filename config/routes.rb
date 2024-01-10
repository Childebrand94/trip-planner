Rails.application.routes.draw do
  root 'home#home'
  resources :users do
    get 'edit_password', to: 'users#edit_password'
    patch 'update_password', to: 'users#update_password'
  end
  resources :invites do
    member do
      get 'accept', to: 'invites#show_accept'
      post 'respond', to: 'invites#respond'
    end
  end

  resources :trips do
    get 'day/:date', to: 'trips#day', as: :trip_day
    resources :expenses
    resources :debtors
    resources :user_trips
    resources :notes
    resources :itinerary_items, path: 'itinerary' do
      resources :comments
      post 'vote', to: 'itinerary_votes#vote'
    end
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
