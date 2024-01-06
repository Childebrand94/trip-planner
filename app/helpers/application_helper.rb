module ApplicationHelper
  include Authorization

  def admin_for_trip?(trip)
    user_trip = current_user.user_trips.find_by(trip:)
    user_trip&.user_trip_role&.role == ROLES['Admin']
  end

  def render_trip_itinerary_footer?
    %w[itinerary_items expenses debts user_trips].include?(controller_name)
  end
end
