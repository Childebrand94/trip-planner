class ItineraryItemsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @itinerary_items = @trip.itinerary_by_day
  end

  def new
    @itinerary_items = ItineraryItems.new
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @itinerary_item = @trip.itinerary_items
  end

  def edit
    @itinerary_items = ItineraryItems.find(params[:id])
  end

  def update
    @itinerary_items = ItineraryItems.find(params[:id])

    if @itinerary_items.update(trip_params)
      redirect_to itinerary_items_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @itinerary_item = @trip.itinerary_items.create(itinerary_items_params)
    redirect_to trip_path(@trip)
  end

  def destroy
    @itinerary_items = ItineraryItems.find(params[:id])
    @itinerary_items.destroy

    redirect_to itinerary_items_path, status: :see_other
  end

  private

  def itinerary_items_params
    params.require(:itinerary_item).permit(:event_name, :start_time, :end_time)
  end
end
