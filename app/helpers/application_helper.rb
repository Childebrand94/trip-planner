module ApplicationHelper
  include Authorization

  def admin_for_trip?(trip)
    user_trip = current_user.user_trips.find_by(trip:)
    user_trip&.user_trip_role&.role == ROLES['Admin']
  end

  def render_trip_itinerary_footer?
    %w[itinerary_items expenses debts user_trips].include?(controller_name)
  end

  def navigation_items(trip)
    nav_items = [
      { title: 'Overview', path: trip_path(trip) },
      { title: 'Itinerary', path: trip_itinerary_items_path(trip) },
      { title: 'Expenses', path: trip_expenses_path(trip) },
      { title: 'My Debts', path: trip_debtors_path(trip) }
    ]

    nav_items << { title: 'Manage Members', path: trip_user_trips_path(trip) } if admin_for_trip?(trip)

    nav_items
  end
end
