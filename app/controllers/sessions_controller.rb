class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params.dig(:user, :email))
    if user&.authenticate(params.dig(:user, :password))
      login(user)
      redirect_to root_path, notice: 'Successfully logged in.'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Successfully logged out.'
  end
end
