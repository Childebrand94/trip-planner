class UserMailer < ApplicationMailer
  default from: ENV['EMAIL_USERNAME']

  def registration_confirmation(user)
    @user = user
    bootstrap_mail(to: user.email,
                   subject: 'Registration Confirmation')
  end
end
