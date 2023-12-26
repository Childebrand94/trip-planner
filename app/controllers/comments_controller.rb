class CommentsController < ApplicationController
  before_action :set_itinerary_item
  before_action :set_trip

  def index
    @comment = @itinerary_item.comments.new
    @all_comments = @itinerary_item.comments
  end

  def create
    @comment = @itinerary_item.comments.new(comment_params)
    @comment.author_id = current_user.id
    if @comment.save
      redirect_to trip_itinerary_item_comments_path(@trip, @itinerary_item,
                                                    date: params[:date]),
                  notice: 'Comment was successfully created'
    else
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to trip_itinerary_item_comments_path(@trip, @itinerary_item,
                                                    date: params[:date])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to trip_itinerary_item_comments_path(@trip, @itinerary_item,
                                                  date: params[:date])
  end

  def show; end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_itinerary_item
    @itinerary_item = ItineraryItem.find(params[:itinerary_item_id])
  end

  def comment_params
    params.require(:comment).permit(:author_id, :itinerary_item_id, :body)
  end
end
