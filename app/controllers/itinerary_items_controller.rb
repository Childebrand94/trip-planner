class ItineraryItemsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @itinerary_item = ItineraryItem.new
    @types = ItineraryItemType.all.map { |type| [type.name, type.id] }
    @date_range = (@trip.start_date..@trip.end_date)
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @itinerary_item = @trip.itinerary_items
  end

  def new
    @itinerary_item = ItineraryItem.new
    @types = ItineraryItemType.all.map { |type| [type.name, type.id] }
  end

  def edit
    @itinerary_item = ItineraryItem.find(params[:id])
    @types = ItineraryItemType.all.map { |type| [type.name, type.id] }
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
    @itinerary_item = @trip.itinerary_items.new(itinerary_item_params)

    if @itinerary_item.save
      redirect_to trip_itinerary_items_path
    else
      render 'trips/show', status: :unprocessable_entity
    end
  end

  def destroy
    @itinerary_items = ItineraryItems.find(params[:id])
    @itinerary_items.destroy

    redirect_to itinerary_items_path, status: :see_other
  end

  private

  def itinerary_item_params
    params.require(:itinerary_item).permit(:item_type_id, :event_name, :address, :start_time, :end_time)
  end
end
