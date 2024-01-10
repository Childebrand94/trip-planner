class InvitesController < ApplicationController
  def new
    @token = params[:invite_token]
    @invite = Invite.new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @trip = Trip.find(params[:invite][:trip_id])
    @invite = build_invite
    if @invite.save
      process_invite
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show_accept
    @invite = Invite.find_by(token: params[:invite_token])
    redirect_to root_path, alert: 'Invite not found.' if @invite.nil?
  end

  def respond
    @invite = load_invite_from_token

    if @invite.nil?
      redirect_to root_path, alert: 'Invite not found.'
      return
    end

    process_invite_response
  end

  private

  def load_invite_from_token
    invite_token = params[:invite][:invite_token]
    Invite.find_by(token: invite_token)
  end

  def process_invite_response
    case params[:response]
    when 'accept'
      process_accept
    when 'decline'
      process_decline
    else
      invalid_response_action
    end
  end

  def process_accept
    if @invite.present?
      add_user_to_trip_with_role
      redirect_to trip_path(@invite.trip_id), notice: 'Added to trip.'
    else
      render :show_accept, status: :unprocessable_entity
    end
  end

  def process_decline
    if @invite.present?
      @invite.destroy
      redirect_to root_path, notice: 'Invite was declined.'
    else
      render :show_accept, status: :unprocessable_entity
    end
  end

  def invalid_response_action
    render :show_accept, status: :unprocessable_entity, alert: 'Invalid response.'
  end

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
    InvitationMailer.existing_user_invite(@invite,
                                          accept_invite_url(@invite, invite_token: @invite.token)).deliver_now
  end

  def handle_new_user
    InvitationMailer.new_user_invite(@invite,
                                     new_user_url(invite_token: @invite.token)).deliver
  end

  def add_user_to_trip_with_role
    role = UserTripRole.find_or_create_by(role: 'Member')
    UserTrip.create!(user: @invite.recipient, trip: @invite.trip, user_trip_role: role)
  end

  def invite_params
    params.require(:invite).permit(:email, :trip_id, :response)
  end
end
