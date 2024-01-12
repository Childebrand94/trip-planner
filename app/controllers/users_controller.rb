class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def show; end

  def new
    @user = User.new
    @token = params[:invite_token]
  end

  def edit; end

  def edit_password
    @user = User.find(params[:user_id])
    render 'edit_password'
  end

  def update_password
    @user = User.find(params[:user_id])

    unless @user.authenticate(params[:user][:old_password])
      @user.errors.add(:old_password, 'is incorrect')
      render :edit, status: :unprocessable_entity and return
    end

    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'User was successfully updated.'
    else
      render user_edit_password_path(@user), status: :unprocessable_entity
    end
  end

  def create
    @user = User.new(user_params)
    @token = params[:user][:invite_token]

    # Using a transaction block in case any part of the user creation
    # with the invitation fails the whole transaction will be rolled back.
    User.transaction do
      if @token.present?
        invite_flow
      else
        registration_flow
      end
    end
  end

  def update
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

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to the PathFindr! Your email has been confirmed.
      Please sign in to continue."
      redirect_to login_path
    else
      flash[:error] = 'Sorry. User does not exist'
      redirect_to root_url
    end
  end

  private

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

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:display_name, :first_name, :last_name,
                                 :email, :password, :password_confirmation)
  end
end
