class InvitesController < ApplicationController
  def new
    @token = params[:invite_token]
    @invite = Invite.new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @invite = build_invite
    if @invite.save
      process_invite
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def build_invite
    invite = Invite.new(invite_params)
    invite.sender_id = current_user.id
    invite
  end

  def process_invite
    if @invite.recipient
      handle_existing_user
    else
      handle_new_user
    end
    redirect_to trip_path(@invite.trip.id), notice: 'Invite was successful'
  end

  def handle_existing_user
    # InvitationMailer.existing_user_invite(@invite).deliver
    add_user_to_trip_with_role
  end

  def handle_new_user
    InvitationMailer.new_user_invite(@invite, new_user_url(invite_token: @invite.token)).deliver_later
  end

  def add_user_to_trip_with_role
    role = UserTripRole.find_or_create_by(role: 'Member')
    UserTrip.create!(user: @invite.recipient, trip: @invite.trip, user_trip_role: role)
  end

  def invite_params
    params.require(:invite).permit(:email, :trip_id)
  end
end
