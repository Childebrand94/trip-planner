class UserService
  def initialize(user, redirect_url)
    @user = user
    @redirect_url = redirect_url
  end

  def process
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      true
    else
      false
    end
  end

  def redirect_path
    @redirect_url
  end

  def notice_message
    'Please confirm your email address to continue'
  end

  def error_message
    'Ooooppss, something went wrong!'
  end
end
