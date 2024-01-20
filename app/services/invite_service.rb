class InviteService
  def initialize(user, token, redirect_url)
    @user = user
    @token = token
    @redirect_url = redirect_url
  end

  def process
    User.transaction do
      raise ActiveRecord::Rollback unless @user.save && process_invite_token

      true
    end
  rescue ActiveRecord::Rollback
    false
  end

  def redirect_path
    @redirect_url
  end

  def notice_message
    'User was successfully created.'
  end

  def error_message
    'Error processing invite.'
  end

  private

  def process_invite_token
    invite = Invite.find_by_token(@token)
    if invite
      add_user_to_trip(invite.trip)
      @user.email_activate
      true
    else
      false
    end
  end

  def add_user_to_trip(trip)
    role = UserTripRole.find_by(role: 'Member')
    UserTrip.create!(user: @user, trip:, user_trip_role: role)
  end
end
