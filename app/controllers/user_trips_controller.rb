class UserTripsController < ApplicationController
  before_action :set_roles, only: %i[edit update]
  before_action :set_trip, only: %i[index edit update destroy]

  def new
    @user_trip = UserTrip.new
  end

  def index
    @users = UserTrip.where(trip_id: @trip)
  end

  def edit
    redirect_to trip_user_trips_path(@trip) unless current_user.user_trips.user_trip_role_id == 1
    @trip = Trip.find_by(id: params[:trip_id])
    @user_trip = @trip.user_trips.find_by(id: params[:id])
  end

  def update
    @user_role = UserTrip.find(params[:id])

    if @user_role.update(user_trip_params)
      redirect_to trip_user_trips_path(@trip)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user_trip = UserTrip.find(params[:id])
    @user_trip.destroy

    redirect_to trip_user_trips_path(trip_id: @trip)
  end

  private

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
