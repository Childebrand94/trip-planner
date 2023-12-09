# Rails.application.routes.draw do
# User routes
resources :users do
  resources :trips, only: [:index]
end

# Trip routes
resources :trips do
  resources :days, only: %i[index create show update destroy] do
    resources :itinerary_items, only: %i[index create show update destroy]
  end

  # Nested routes for expenses within trips
  resources :expenses, only: %i[index create show update destroy] do
    resources :debtors, only: %i[index create show update destroy]
  end
end

# Expense routes (not nested under trips)
resources :expenses, only: [] do
  resources :debtors, only: %i[index create show update destroy]
end

# Itinerary Item routes (not nested under days)
# Assuming you still want direct access to itinerary items
resources :itinerary_items, only: [] do
  # Routes for comments and votes associated with an itinerary item
  resources :comments, only: [:create]
  resources :votes, only: [:create]
end
