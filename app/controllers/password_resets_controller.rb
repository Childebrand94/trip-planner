class PasswordResetsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])

    PasswordMailer.with(user: @user).reset.deliver_later if @user.present?

    redirect_to root_path, notice: 'An email has been sent to reset your password'
  end

  def edit
    @user = User.find_signed(params[:token], purpose: 'password_reset')
    return unless @user.nil?

    redirect_to root_path, alert: 'Invalid or expired token'
    nil
  end

  def update
    begin
      @user = User.find_signed!(params[:user][:token], purpose: 'password_reset')
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to password_reset_path, alert: 'Your token has expired. Please try again.'
      return
    end

    if @user.update(password_params)
      redirect_to login_path, notice: 'Your password has been reset successfully'
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
