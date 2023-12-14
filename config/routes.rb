Rails.application.routes.draw do
  root 'home#home'
  resources :users

  resources :trips do
    resources :itinerary_items, path: 'itinerary' do
      resources :comments
    end
    get 'day/:date', to: 'trips#day', as: :trip_day
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
