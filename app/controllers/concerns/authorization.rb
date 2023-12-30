module Authorization
  extend ActiveSupport::Concern

  ROLES = {
    'Admin' => 'Admin',
    'Editor' => 'Editor',
    'Viewer' => 'Viewer'
  }.freeze

  def authorize_for_trip(trip, roles)
    user_trip_role = current_user.user_trips.find_by(trip_id: trip.id)&.user_trip_role&.role
    unless user_trip_role && roles.include?(user_trip_role)
      redirect_back(fallback_location: root_path, alert: 'You are not authorized to perform this action.')
      return false
    end
    true
  end
end
