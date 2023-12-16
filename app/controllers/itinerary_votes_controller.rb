class ItineraryVotesController < ApplicationController
  before_action :set_itinerary_item
  before_action :set_date
  before_action :set_trip
  before_action :set_vote_totals

  def vote
    @date = Date.parse(params[:date])
    @vote = @itinerary_item.itinerary_votes.find_by(user_id: current_user.id)
    if @vote
      update_user_vote
    else
      create_user_vote
    end
  end

  private

  def update_user_vote
    if @vote.update(vote_params)
      redirect_to trip_trip_day_path(@trip.id, @date), notice: 'Vote was updated'
    else
      render 'trips/day', status: :unprocessable_entity
    end
  end

  def create_user_vote
    @itinerary_vote = @itinerary_item.itinerary_votes.new(vote_params)
    @itinerary_vote.user = current_user
    if @itinerary_vote.save
      redirect_to trip_trip_day_path(@trip.id, @date), notice: 'Vote was successfully created'
    else
      render 'trips/day', status: :unprocessable_entity
    end
  end

  def set_itinerary_item
    @itinerary_item = ItineraryItem.find(params[:itinerary_item_id])
    puts @itinerary_item.inspect
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_date
    @date = params[:date]
  end

  def set_vote_totals
    puts @itinerary_item.itinerary_votes.inspect
    @up_votes = @itinerary_item.itinerary_votes.up_vote_total.count
    @down_votes = @itinerary_item.itinerary_votes.down_vote_total.count
  end

  def vote_params
    params.require(:itinerary_vote).permit(:user_id, :up_vote, :itinerary_item_id)
  end
end
