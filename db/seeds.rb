require 'faker'
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre name|
#     MovieGenre.find or_create_by!(name: genre_name)
#   endo

names = ['Dining', 'Check In', 'Check Out', 'Excursion', 'Business', 'Travel']

names.each do |type|
  ItineraryItemType.find_or_create_by(name: type)
end

EXPENSES = [
  'Flights',
  'Lodging',
  'Car rental',
  'Public transit',
  'Food',
  'Drinks',
  'Sightseeing',
  'Activities',
  'Shopping',
  'Gas',
  'Groceries',
  'Other'
].freeze

EXPENSES.each do |expense|
  ExpenseCategory.find_or_create_by(name: expense)
end

(1..6).each do |i|
  TripImage.find_or_create_by(path: "trip-image-#{i}.png")
end

user_roles = %w[Admin Member]

user_roles.each do |r|
  UserTripRole.find_or_create_by(role: r)
end

# demo data
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
    user.display_name = Faker::FunnyName.name
    user.password = user_password
    user.email_confirmed = true
  end
end

# Create a demo trip
demo_trip = Trip.create!(
  name: 'Demo Trip to Vegas',
  location: 'Las Vegas, NV, USA',
  trip_image_id: 4,
  start_date: Date.tomorrow + 1.year,
  end_date: Date.tomorrow + 1.year + 4.days
)

(1..5).each do |i|
  user = User.find_by(email: "demo_user_#{i}@example.com")
  UserTrip.create!(user:, trip: demo_trip, user_trip_role_id: 1) if user
end

# Example notes
notes = [
  'Booked a suite at the Bellagio Hotel with a view of the fountains. Check-in is at 3 PM.',
  'Day 1: Evening walk along the Strip to see the light shows. Dinner reservations at 8 PM at Gordon Ramsay Steak.',
  "Tickets booked for 'O' by Cirque du Soleil at the Bellagio at 7 PM. Pick up tickets at the box office by 6:30 PM."
]

user = User.find_by(email: 'demo_user_1@example.com')

# Create notes for the demo trip
notes.each do |note_body|
  Note.create!(
    body: note_body,
    author_id: user.id,
    trip_id: demo_trip.id
  )
end

# Create itinerary items Types
# item_type_dining = ItineraryItemType.find_by(name: 'Dining')
# item_type_checkin = ItineraryItemType.find_by(name: 'Check In')
# item_type_checkout = ItineraryItemType.find_by(name: 'Check Out')
# item_type_business = ItineraryItemType.find_by(name: 'Business')
# item_type_travel = ItineraryItemType.find_by(name: 'Travel')
# item_type_excursion = ItineraryItemType.find_by(name: 'Excursion')

itinerary_items = [
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
]

# Creating itinerary items
itinerary_items.each do |item|
  ItineraryItem.create!(
    event_name: item[:event_name],
    address: item[:address],
    start_time: item[:start_time],
    end_time: item[:end_time],
    creator_id: user.id,
    item_type_id: item[:item_type],
    trip_id: demo_trip.id
  )
end
