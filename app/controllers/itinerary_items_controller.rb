class ItineraryItemsController < ApplicationController
  # drying out code
  before_action :set_trip, only: %i[index show new edit create update]
  before_action :set_types, only: %i[index new edit update]

  def index
    @itinerary_item = ItineraryItem.new
    @date_range = (@trip.start_date..@trip.end_date)
  end

  def show
    @itinerary_item = @trip.itinerary_items.find(params[:id])
  end

  def new
    @itinerary_item = ItineraryItem.new
  end

  def edit
    @itinerary_item = ItineraryItem.find(params[:id])
    @date = params[:date]
    @date_range = (@trip.start_date..@trip.end_date)
  end

  def update
    @itinerary_item = ItineraryItem.find(params[:id])

    if @itinerary_item.update(itinerary_item_params)
      redirect_to trip_itinerary_items_path(@itinerary_item.trip)
    else
      @date_range = (@trip.start_date..@trip.end_date)
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @itinerary_item = @trip.itinerary_items.new(itinerary_item_params)
    @itinerary_item.creator_id = current_user.id

    if @itinerary_item.save
      redirect_to trip_itinerary_items_path
    else
      render 'trips/show', status: :unprocessable_entity
    end
  end

  def destroy
    @itinerary_item = ItineraryItem.find(params[:id])
    @itinerary_item.destroy

    redirect_to trip_itinerary_items_path, status: :see_other
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_types
    @types = ItineraryItemType.all.map { |type| [type.name, type.id] }
  end

  def itinerary_item_params
    params.require(:itinerary_item).permit(:creator_id, :item_type_id, :event_name, :address, :start_time, :end_time)
  end
end
