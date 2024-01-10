class InvitationMailer < ApplicationMailer
  default from: ENV['EMAIL_USERNAME']

  def existing_user_invite(invite, accept_url)
    @invite = invite
    @trip = invite.trip
    @sender = invite.sender
    @recipient = invite.recipient
    @accept_url = accept_url

    bootstrap_mail(to: @recipient.email,
                   reply_to: @sender.email,
                   subject: 'You are Invited to Join a Trip')
  end

  def new_user_invite(invite, signup_url)
    @invite = invite
    @trip = invite.trip
    @sender = invite.sender
    @signup_url = signup_url

    bootstrap_mail(to: invite.email,
                   reply_to: @sender.email,
                   subject: 'You are Invited to Join a Trip')
  end
end
