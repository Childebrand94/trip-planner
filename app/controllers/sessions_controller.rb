class SessionsController < ApplicationController
  before_action :set_invite_token, only: %i[create]

  def new; end

  def create
    session_service = SessionService.new(user_params, @token)

    if session_service.authenticate
      handle_successful_authentication(session_service)
    else
      flash.now[:alert] = session_service.error_message
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Successfully logged out.'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def set_invite_token
    @token = params[:user][:invite_token]
  end

  def handle_successful_authentication(service)
    login(service.user)
    if @token.present?
      handle_invite_token
    else
      redirect_to root_path, notice: service.notice_message
    end
  end

  def handle_invite_token
    invite = load_invite_from_token
    redirect_to accept_invite_path(id: invite.id, invite_token: invite.token), notice: 'Successfully logged in.'
  end

  def load_invite_from_token
    Invite.find_by(token: @token)
  end
end
