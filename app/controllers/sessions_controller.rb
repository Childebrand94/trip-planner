class SessionsController < ApplicationController
  before_action :set_invite_token, only: %i[create]

  def new; end

  def create
    user = User.find_by(email: params.dig(:user, :email))
    if user&.authenticate(params.dig(:user, :password))
      if user.email_confirmed
        login(user)
        redirect_to trips_path
      else
        flash.now[:error] = 'Please activate your account by following the
      instructions in the account confirmation email you received to proceed'
        render :new, status: :unprocessable_entity
      end
      handle_invite_token if @token.present?
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Successfully logged out.'
  end

  private

  def set_invite_token
    @token = params[:user][:invite_token]
  end

  def handle_invite_token
    invite = load_invite_from_token
    if invite.present?
      redirect_to accept_invite_path(id: invite.id, invite_token: token), notice: 'Successfully logged in.'
    else
      redirect_to trips_path, notice: 'Successfully logged in.'
    end
  end

  def load_invite_from_token
    invite_token = params[:user][:invite_token]
    Invite.find_by(token: invite_token)
  end
end
