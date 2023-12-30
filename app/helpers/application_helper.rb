module ApplicationHelper
  include Authorization

  def admin_for_trip?(trip)
    user_trip = current_user.user_trips.find_by(trip:)
    user_trip&.user_trip_role&.role == ROLES['Admin']
  end
end
