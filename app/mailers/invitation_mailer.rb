class InvitationMailer < ApplicationMailer
  default from: ENV['EMAIL_USERNAME']

  def existing_user_invite(invite)
    @invite = invite
    @trip = invite.trip
    @sender = invite.sender
    @recipient = invite.recipient

    mail(to: @recipient.email,
         reply_to: @sender.email,
         subject: 'Invitation to Join a Trip')
  end

  def new_user_invite(invite, signup_url)
    @invite = invite
    @trip = invite.trip
    @sender = invite.sender
    @signup_url = signup_url

    mail(to: invite.email,
         reply_to: @sender.email,
         subject: 'You are Invited to Join a Trip')
  end
end
