module ApplicationHelper
  include Authorization

  def admin_for_trip?(trip)
    user_trip = current_user.user_trips.find_by(trip:)
    user_trip&.user_trip_role&.role == ROLES['Admin']
  end

  def render_trip_itinerary_footer?
    %w[itinerary_items expenses debts user_trips debtors].include?(controller_name) && action_name != 'edit'
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

  def trip_image(trip)
    "trip-image-#{trip.trip_image.id}.png"
  end

  def flash_class(level)
    cases = { notice: 'alert alert-info',
              success: 'alert alert-success',
              error: 'alert alert-error',
              alert: 'alert alert-error' }
    cases[level]
  end

  def background_color(type)
    case type
    when 'Dining'
      'bg-dining'
    when 'Stay'
      'bg-stay'
    when 'Excursion'
      'bg-excursion'
    when 'Business'
      'bg-business'
    when 'Travel'
      'bg-travel'
    else
      'bg-light'
    end
  end
end
