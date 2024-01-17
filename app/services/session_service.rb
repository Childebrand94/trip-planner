class SessionService
  attr_reader :user, :error_message

  def initialize(user_params, token)
    @user_params = user_params
    @token = token
    @user = nil
    @error_message = nil
  end

  def authenticate
    @user = User.find_by(email: @user_params[:email])
    return false unless @user&.authenticate(@user_params[:password])

    unless @user.email_confirmed
      @error_message = 'Please activate your account by following the instructions in the account confirmation email you received to proceed'
      return false
    end

    true
  end

  def notice_message
    'Successfully logged in.'
  end
end
