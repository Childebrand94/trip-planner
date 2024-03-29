class TripsController < ApplicationController
  before_action :set_trip, only: %i[show edit update destroy]
  before_action :check_demo_user, only: %i[update destroy create]

  def index
    @trips = current_user.trips
  end

  def new
    @trip = Trip.new
  end

  def show
    @note = Note.new
    show_notes(params[:notes_filter])
  end

  def edit
    unless admin_for_trip?(@trip)
      redirect_back(fallback_location: trip_path,
                    alert: 'You are not authorized to perform this action.')
      return
    end

    @trip = Trip.find(params[:id])
  end

  def update
    if @trip.update(trip_params)
      redirect_to params[:return_to] || trips_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save

      role = UserTripRole.find_by role: 'Admin'
      @trip.user_trips.create(user: current_user, user_trip_role: role)
      redirect_to trips_path, notice: 'Trip was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    unless admin_for_trip?(@trip)
      redirect_back(fallback_location: trip_path,
                    alert: 'You are not authorized to perform this action.')
      return
    end

    @trip.destroy

    redirect_to trips_path, status: :see_other
  end

  def day
    @trip = Trip.find(params[:trip_id])
    @date = Date.parse(params[:date])
    @itinerary_items = @trip.itinerary_by_day[@date]
  end

  private

  def show_notes(method)
    @all_notes = case method
                 when 'active'
                   @trip.notes.active
                 when 'completed'
                   @trip.notes.completed
                 else
                   @trip.notes
                 end
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:name, :location, :start_date, :end_date,
                                 :trip_image_id)
  end
end
