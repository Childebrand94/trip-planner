class NotesController < ApplicationController
  before_action :set_trip, only: %i[index create show edit update destroy]

  def index
    @note = @tirp.notes.new
    @notes = @trip.notes
  end

  def show; end

  def edit
    @note = Note.find(params[:id])
    return if user_has_permission?(@note, @trip, :author_id)

    redirect_to trip_path(@trip),
                alert: 'You are not authorized to perform this action.' and return
  end

  def create
    @note = @trip.notes.new(note_params)
    @note.author_id = current_user.id

    if @note.save
      redirect_to trip_path(@trip), notice: 'Note was successful created'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      redirect_to trip_path(@trip),
                  notice: 'Comment was updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @note = Note.find(params[:id])
    unless user_has_permission?(@note, @trip, :author_id)
      redirect_back(fallback_location: trip_path(@trip),
                    alert: 'You are not authorized to perform this action.') and return
    end

    @note.destroy

    redirect_back(fallback_location: trip_path(@trip),
                  notice: 'Note was successfully deleted.')
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def note_params
    params.require(:note).permit(:body, :completed)
  end
end
