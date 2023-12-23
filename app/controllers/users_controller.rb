class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def show
    @users = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    @token = params[:user][:invite_token]

    # Using a transaction block in case any part of the user creation
    # with the invitation fails the whole transaction will be rolled back.
    User.transaction do
      if @user.save
        process_invite_token if @token.present?
        redirect_to login_path, notice: 'User was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def update
    unless @user.authenticate(params[:user][:old_password])
      @user.errors.add(:old_password, 'is incorrect')
      render :edit, status: :unprocessable_entity and return
    end

    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'User was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy!

    redirect_to root_path, notice: 'User was successfully destroyed.'
  end

  private

  def process_invite_token
    invite = Invite.find_by_token(@token)
    if invite
      add_user_to_trip(invite.trip)
    else
      render :new, status: :unprocessable_entity
      raise ActiveRecord::Rollback
    end
  end

  def add_user_to_trip(trip)
    role = UserTripRole.find_or_create_by(role: 'Viewer')
    UserTrip.create!(user: @user, trip:, user_trip_role: role)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:display_name, :email, :password,
                                 :password_confirmation)
  end
end
