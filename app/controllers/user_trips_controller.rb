class UserTripsController < ApplicationController
  before_action :set_roles, only: %i[edit update]
  before_action :set_trip, only: %i[index edit update destroy update]
  before_action :check_demo_user, only: %i[edit destroy]

  def new
    @user_trip = UserTrip.new
  end

  def index
    @user_trips = UserTrip.where(trip_id: @trip)
  end

  def edit
    unless admin_for_trip?(@trip)
      redirect_back(fallback_location: trip_user_trips_path(@trip),
                    alert: 'You are not authorized to perform this action.')
    end

    @trip = Trip.find_by(id: params[:trip_id])
    @user_trip = @trip.user_trips.find_by(id: params[:id])
  end

  def update
    @user_trip = UserTrip.find(params[:id])

    result = change_role(@user_trip, user_trip_params[:user_trip_role_id])

    if result[:success]
      flash[:notice] = result[:message]
      redirect_to trip_user_trips_path(@trip)
    else
      flash[:alert] = result[:message]
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    trip_id = params[:trip_id]
    user_id = params[:id]

    @user_trip = UserTrip.find_by(trip_id:, user_id:)

    if @user_trip
      @user_trip.destroy
      if current_user.id.to_i == user_id.to_i
        redirect_to trips_path, notice: 'You have successfully left the trip.'
      else
        redirect_to trip_user_trips_path(trip_id:), notice: 'User was successfully removed from the trip.'
      end
    else
      redirect_to trip_path(trip_id), alert: 'User trip not found.'
    end
  end

  private

  def change_role(user_trip, new_role_id)
    is_currently_admin = user_admin_for_trip?(@trip, user_trip.user)
    admin_count = get_admin_count(@trip)

    return { success: false, message: 'Cannot remove the last admin.' } if admin_count == 1 && is_currently_admin

    user_trip.user_trip_role_id = new_role_id
    if user_trip.save
      { success: true, message: 'Role updated successfully.' }
    else
      { success: false, message: 'Failed to update role.' }
    end
  end

  def user_admin_for_trip?(trip, user)
    user_trip = user.user_trips.find_by(trip:)
    user_trip&.user_trip_role&.role == ROLES['Admin']
  end

  def get_admin_count(trip)
    admin_role = UserTripRole.find_by(role: 'Admin')

    UserTrip.where(user_trip_role_id: admin_role.id)
            .where(trip_id: trip.id)
            .count
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_roles
    @roles = UserTripRole.all.map { |r| [r.role.capitalize, r.id] }
  end

  def user_trip_params
    params.require(:user_trip).permit(:user_trip_role_id,
                                      :trip_id, :user_id)
  end
end
