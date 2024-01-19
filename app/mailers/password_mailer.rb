class PasswordMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #

  default from: ENV['EMAIL_USERNAME']

  def reset
    @token = params[:user].signed_id(purpose: 'password_reset', expires_in: 15.minutes)

    bootstrap_mail to: params[:user].email
  end
end
