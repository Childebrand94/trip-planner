class TripDaysController < ApplicationController
  def index
    @days = TripDay.all
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @day = @trip.day.create(trip_day_params)
    redirect_to trip_path(@trip)
  end

  def show
    @day = TripDay.find(params[:id])
  end

  def update; end

  def destroy; end

  private

  def trip_day_params
    params.require(:trip_day).premit(:date)
  end
end
