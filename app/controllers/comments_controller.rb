class CommentsController < ApplicationController
  before_action :set_itinerary_item
  before_action :set_trip
  before_action :set_date, only: %i[index edit create]
  before_action :check_demo_user, only: %i[update destroy]

  def index
    @comment = Comment.new(itinerary_item_id: @itinerary_item.id)
    @all_comments = @itinerary_item.comments.where.not(id: nil)
  end

  def create
    @comment = @itinerary_item.comments.new(comment_params)
    @comment.author_id = current_user.id
    if @comment.save
      redirect_to trip_itinerary_item_comments_path(@trip, @itinerary_item,
                                                    date: @date),
                  notice: 'Comment was successfully created'
    else
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    return if user_has_permission?(@comment, @trip, :author_id)

    redirect_to trip_itinerary_item_comments_path(@trip, @itinerary_item),
                alert: 'You are not authorized to perform this action.' and return
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to trip_itinerary_item_path(@trip, @itinerary_item),
                  notice: 'Comment was updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    unless user_has_permission?(@comment, @trip, :author_id)
      redirect_back(fallback_location: trip_itinerary_item_comments_path(@trip, @itinerary_item),
                    alert: 'You are not authorized to perform this action.') and return
    end

    @comment.destroy
    redirect_back(fallback_location: trip_itinerary_item_comments_path(@trip, @itinerary_item),
                  notice: 'Comment was successfully deleted.')
  end

  def show; end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_itinerary_item
    @itinerary_item = ItineraryItem.find(params[:itinerary_item_id])
  end

  def set_date
    @date = Date.parse(@itinerary_item.start_time.strftime('%Y-%m-%d'))
  end

  def comment_params
    params.require(:comment).permit(:author_id, :itinerary_item_id, :body)
  end
end
