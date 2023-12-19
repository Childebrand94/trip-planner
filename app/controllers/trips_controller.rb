class TripsController < ApplicationController
  def index
    @trips = current_user.trips
  end

  def new
    @trip = Trip.new
  end

  def show
    @trip = Trip.find(params[:id])
    @itinerary_item = ItineraryItem.new
    @types = ItineraryItemType.all.map { |type| [type.name, type.id] }
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])

    if @trip.update(trip_params)
      redirect_to trips_path
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
    @trip = Trip.find(params[:id])
    @trip.destroy

    redirect_to trips_path, status: :see_other
  end

  def day
    @trip = Trip.find(params[:trip_id])
    @date = Date.parse(params[:date])
    @itinerary_items = @trip.itinerary_by_day[@date]
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :location, :start_date, :end_date)
  end
end
