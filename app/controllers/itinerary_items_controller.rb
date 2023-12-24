class ItineraryItemsController < ApplicationController
  before_action :set_trip, only: %i[index show new edit create update]
  before_action :set_types, only: %i[index new edit update]
  before_action :set_itinerary_item, only: %i[show update edit]
  # before_action :set_date, only: %i[show edit]

  def index
    @itinerary_item = ItineraryItem.new
    @date_range = (@trip.start_date..@trip.end_date)
  end

  def show
    @up_votes = @itinerary_item.itinerary_votes.where(up_vote: true)
    @down_votes = @itinerary_item.itinerary_votes.where(up_vote: false)
    @all_comments = @itinerary_item.comments
    # @items_by_day = @trip.itinerary_by_day[@date]
    # @conflicting_items = @items_by_day.select do |item|
    # next if item.id == @itinerary_item.id

    # item.start_time < @itinerary_item.end_time &&
    # @itinerary_item.start_time < item.end_time
    # end
  end

  def new
    @itinerary_item = ItineraryItem.new
  end

  def edit; end

  def update
    if @itinerary_item.update(itinerary_item_params)
      redirect_back(fallback_location: root_path, notice: 'Item was updaed')
    # redirect_to trip_itinerary_item_path(@itinerary_item.trip,
    # @itinerary_item)
    else
      @date_range = (@trip.start_date..@trip.end_date)
      render :edit, status: :unprocessable_entity
    end
  end

  def create
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

  def set_date
    @date = Date.parse(params[:date])
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_itinerary_item
    @itinerary_item = @trip.itinerary_items.find(params[:id])
  end

  def set_types
    @types = ItineraryItemType.all.map { |type| [type.name, type.id] }
  end

  def itinerary_item_params
    params.require(:itinerary_item).permit(:creator_id, :item_type_id, :event_name, :address, :start_time, :end_time)
  end
end
