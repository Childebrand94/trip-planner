class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :set_token, only: %i[create]

  def show; end

  def edit; end

  def new
    @user = User.new
    @token = params[:invite_token]
  end

  def create
    @user = User.new(user_params)
    service = @token.present? ? InviteService.new(@user, @token, new_user_path) : UserService.new(@user, root_path)

    if service.process
      redirect_to service.redirect_path, notice: service.notice_message
    else
      flash.now[:error] = service.error_message
      render :new, status: :unprocessable_entity
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

  def update_password
    @user = User.find(params[:user_id])

    unless @user.authenticate(params[:user][:old_password])
      @user.errors.add(:old_password, 'is incorrect')
      render 'edit_password', status: :unprocessable_entity and return
    end

    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'User was successfully updated.'
    else
      render user_edit_password_path(@user), status: :unprocessable_entity
    end
  end

  def edit_password
    @user = User.find(params[:user_id])
    render 'edit_password'
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      login(user)
      flash[:success] = "Welcome to the PathFindr #{user.display_name}! Your email has been confirmed."
      redirect_to root_path
    else
      flash[:error] = 'Sorry. User does not exist'
      redirect_to root_url
    end
  end

  def resend_confirmation
    flash[:notice] = 'Confirmation email has been resent. Please check your email.'
    redirect_to root_path
  end

  private

  def set_token
    @token = params[:user][:invite_token]
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:display_name, :first_name, :last_name,
                                 :email, :password, :password_confirmation)
  end
end
