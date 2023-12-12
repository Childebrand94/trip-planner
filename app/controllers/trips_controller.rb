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
    @trip = current_user.trips.build(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to trips_path, notice: 'Trip was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    redirect_to trips_path, status: :see_other
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :location, :start_date, :end_date)
  end
end
