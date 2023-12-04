class TripsController < ApplicationController
  def index
    @trip = Trip.new
  end

  def new
    @trip = Trip.new
  end
end
