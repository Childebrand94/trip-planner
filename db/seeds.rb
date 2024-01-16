# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre name|
#     MovieGenre.find or_create_by!(name: genre_name)
#   endo
require 'faker'
require_relative 'seed_data'

ITINERARY_ITEM_TYPES.each do |type|
  ItineraryItemType.find_or_create_by(name: type)
end

EXPENSE_CATEGORIES.each do |expense|
  ExpenseCategory.find_or_create_by(name: expense)
end

(1..6).each do |i|
  TripImage.find_or_create_by(path: "trip-image-#{i}.png")
end

USER_ROLES.each do |r|
  UserTripRole.find_or_create_by(role: r)
end

# demo data
ItineraryVote.delete_all
Comment.delete_all
Debtor.delete_all
Expense.delete_all
ItineraryItem.delete_all
Note.delete_all
UserTrip.delete_all
Trip.delete_all
User.delete_all

user_password = 'password'

(1..5).each do |i|
  email = "demo_user_#{i}@example.com"
  User.find_or_create_by(email:) do |user|
    user.first_name = Faker::Name.first_name
    user.last_name = Faker::Name.last_name
    user.display_name = "demo_user_#{i}"
    user.password = user_password
    user.email_confirmed = true
    user.demo = true
  end
end

# Create a demo trip
demo_trip = Trip.create!(
  id: 0,
  name: 'Demo Trip to Vegas',
  location: 'Las Vegas, NV, USA',
  trip_image_id: 4,
  start_date: Date.tomorrow + 1.year,
  end_date: Date.tomorrow + 1.year + 4.days
)

# Get all users from db
demo_user_1 = User.find_by(email: 'demo_user_1@example.com')
demo_user_2 = User.find_by(email: 'demo_user_2@example.com')
demo_user_3 = User.find_by(email: 'demo_user_3@example.com')
demo_user_4 = User.find_by(email: 'demo_user_4@example.com')
demo_admin = User.find_by(email: 'demo_user_5@example.com')

# Create admin for trip
UserTrip.create!(user: demo_admin, trip: demo_trip, user_trip_role_id: 1)

# Add users to trip
[demo_user_1, demo_user_2, demo_user_3, demo_user_4].each do |user|
  UserTrip.create!(user:, trip: demo_trip, user_trip_role_id: 2)
end

# Create notes for the demo trip
NOTES.each do |note_body|
  Note.create!(
    body: note_body,
    author_id: demo_admin.id,
    trip_id: demo_trip.id
  )
end

ITINERARY_ITEMS = [
  {
    event_name: 'Check-in at Bellagio Hotel',
    address: 'Bellagio, Las Vegas, NV, USA',
    start_time: demo_trip.start_date.to_time,
    end_time: demo_trip.start_date.to_time + 2.hours,
    item_type: 2
  },
  {
    event_name: 'Dinner at Gordon Ramsay Steak',
    address: 'Paris Las Vegas Hotel & Casino, Las Vegas, NV, USA',
    start_time: demo_trip.start_date.to_time + 7.hours,
    end_time: demo_trip.start_date.to_time + 9.hours,
    item_type: 1
  },
  {
    event_name: 'Dinner in Vegas',
    address: 'Some Restaurant in Las Vegas, NV, USA',
    start_time: demo_trip.start_date.to_time + 7.5.hours,
    end_time: demo_trip.start_date.to_time + 9.5.hours,
    item_type: 1
  },
  {
    event_name: 'Morning Yoga Session',
    address: 'The Venetian, Las Vegas, NV, USA',
    start_time: demo_trip.start_date.to_time + 1.day + 6.hours,
    end_time: demo_trip.start_date.to_time + 1.day + 7.hours,
    item_type: 4
  },
  {
    event_name: 'Business Meeting with Clients',
    address: 'Wynn Las Vegas, Las Vegas, NV, USA',
    start_time: demo_trip.start_date.to_time + 1.day + 10.hours,
    end_time: demo_trip.start_date.to_time + 1.day + 12.hours,
    item_type: 5
  },
  {
    event_name: 'Helicopter Tour of the Grand Canyon',
    address: 'Maverick Helicopters, Las Vegas, NV, USA',
    start_time: demo_trip.start_date.to_time + 2.days + 9.hours,
    end_time: demo_trip.start_date.to_time + 2.days + 12.hours,
    item_type: 1
  },
  {
    event_name: 'Check-out from Bellagio Hotel',
    address: 'Bellagio, Las Vegas, NV, USA',
    start_time: demo_trip.end_date.to_time - 2.hours,
    end_time: demo_trip.end_date.to_time,
    item_type: 3
  }
].freeze

# Creating itinerary items
ITINERARY_ITEMS.each do |item|
  ItineraryItem.create!(
    event_name: item[:event_name],
    address: item[:address],
    start_time: item[:start_time],
    end_time: item[:end_time],
    creator_id: demo_admin.id,
    item_type_id: item[:item_type],
    trip_id: demo_trip.id
  )
end

EXPENSES = [
  {
    name: 'Flights',
    amount: 550,
    date: demo_trip.start_date,
    payer_id: demo_admin.id,
    trip_id: demo_trip.id,
    expense_category_id: 3
  },
  {
    name: 'Golf',
    amount: 100,
    date: demo_trip.start_date + 1.day,
    payer_id: demo_admin.id,
    trip_id: demo_trip.id,
    expense_category_id: 8
  },
  {
    name: 'Hotel Booking',
    amount: 2500,
    date: demo_trip.start_date - 1.day,
    payer_id: demo_user_1.id,
    trip_id: demo_trip.id,
    expense_category_id: 2
  },
  {
    name: 'Restaurant Dinner',
    amount: 75,
    date: demo_trip.start_date + 2.days,
    payer_id: demo_admin.id,
    trip_id: demo_trip.id,
    expense_category_id: 2
  },
  {
    name: 'Museum Tickets',
    amount: 50,
    date: demo_trip.start_date + 3.days,
    payer_id: demo_admin.id,
    trip_id: demo_trip.id,
    expense_category_id: 8
  },
  {
    name: 'Transportation',
    amount: 200,
    date: demo_trip.start_date + 1.day,
    payer_id: demo_admin.id,
    trip_id: demo_trip.id,
    expense_category_id: 4
  },
  {
    name: 'Souvenirs',
    amount: 50,
    date: demo_trip.start_date + 4.days,
    payer_id: demo_admin.id,
    trip_id: demo_trip.id,
    expense_category_id: 6
  }
].freeze

# Creating expenses
EXPENSES.each do |exp|
  Expense.create!(
    name: exp[:name],
    amount: exp[:amount],
    date: exp[:date],
    payer_id: demo_admin.id,
    trip_id: exp[:trip_id],
    expense_category_id: exp[:expense_category_id]
  )
end

hotel_expense = Expense.find_by(name: 'Hotel Booking')

Debtor.create!(
  amount_owed: 700,
  expense_id: hotel_expense.id,
  user_id: demo_admin.id
)

items = ItineraryItem.where(trip_id: demo_trip.id)
users = [demo_user_1, demo_user_2, demo_user_3, demo_user_4]

items.each do |item|
  Comment.create!(
    body: 'Comments main purpose is to help decide on what to plan if items conflict',
    author_id: demo_admin.id,
    itinerary_item_id: item.id
  )

  users.each do |u|
    random_up_vote = [true, false].sample
    ItineraryVote.create!(
      up_vote: random_up_vote,
      itinerary_item_id: item.id,
      user_id: u.id
    )
  end
end
