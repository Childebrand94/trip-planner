class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params.dig(:user, :email))
    if user&.authenticate(params.dig(:user, :password))
      login(user)
      handle_invite_token
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

  def handle_invite_token
    token = params[:user][:invite_token]
    invite = load_invite_from_token
    if invite.present?
      redirect_to accept_invite_path(id: invite.id, invite_token: token), notice: 'Successfully logged in.'
    else
      redirect_to root_path, notice: 'Successfully logged in.'
    end
  end

  def load_invite_from_token
    invite_token = params[:user][:invite_token]
    Invite.find_by(token: invite_token)
  end
end
