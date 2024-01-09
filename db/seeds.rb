# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre name|
#     MovieGenre.find or_create_by!(name: genre_name)
#   endo

names = %w[Dining Stay Excursion Business Travel]

names.each do |type|
  ItineraryItemType.create(name: type)
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
  ExpenseCategory.create(name: expense)
end

(1..6).each do |i|
  TripImage.create(path: "trip-image-#{i}.png")
end

user_roles = %w[Admin Member]

user_roles.each do |r|
  UserTripRole.create(role: r)
end
