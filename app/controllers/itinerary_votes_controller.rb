class ItineraryVotesController < ApplicationController
  before_action :set_itinerary_item
  before_action :set_date

  def vote
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
      redirect_to trip_trip_day_path(@trip, @date)
    else
      render 'trips/day', status: :unprocessable_entity
    end
  end

  def create_user_vote
    @itinerary_vote = @itinerary_item.itinerary_votes.new(vote_params)
    @itinerary_vote.user = current_user
    if @itinerary_vote.save
      redirect_to trip_trip_day_path(@trip, @date), notice: 'Vote was successfully created'
    else
      render 'trips/day', status: :unprocessable_entity
    end
  end

  def set_itinerary_item
    @itinerary_item = ItineraryItem.find(params[:itinerary_item_id])
  end

  def set_date
    @date = params[:date]
  end

  def vote_params
    params.require(:itinerary_vote).permit(:user_id, :up_vote, :itnerary_item_id)
  end
end
