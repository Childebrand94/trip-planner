module Authorization
  extend ActiveSupport::Concern

  ROLES = {
    'Admin' => 'Admin',
    'Member' => 'Member'
  }.freeze

  def admin_for_trip?(trip)
    current_user_role = current_user.user_trips.find_by(trip_id: trip.id)&.user_trip_role&.role
    return false unless current_user_role && current_user_role == ROLES['Admin']

    true
  end

  def user_has_permission?(record, trip, user_id_method = :user_id)
    return true if admin_for_trip?(trip)

    record.send(user_id_method) == current_user.id
  end

  def check_demo_user
    return unless current_user.demo?

    redirect_back(fallback_location: root_path,
                  alert: 'Demo users are not authorized to perform this action.')
  end
end
