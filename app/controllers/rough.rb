def create
  @user = User.new(user_params)
  @token = params[:user][:invite_token]

  User.transaction do
    if @token.present?
      invite_flow
    else
      registration_flow
    end
  end
end

def registration_flow
  if @user.save
    UserMailer.registration_confirmation(@user).deliver
    flash[:success] = 'Please confirm your email address to continue'
    redirect_to root_path
  else
    flash[:error] = 'Ooooppss, something went wrong!'
    render 'new'
    raise ActiveRecord::Rollback
  end
end

def invite_flow
  if @user.save
    process_invite_token
    redirect_to login_path, notice: 'User was successfully created.'
  else
    render :new, status: :unprocessable_entity
  end
end

def process_invite_token
  invite = Invite.find_by_token(@token)
  if invite
    add_user_to_trip(invite.trip)
    @user.email_activate
  else
    render :new, status: :unprocessable_entity
    raise ActiveRecord::Rollback
  end
end

def add_user_to_trip(trip)
  role = UserTripRole.find_by(role: 'Member')
  UserTrip.create!(user: @user, trip:, user_trip_role: role)
end
