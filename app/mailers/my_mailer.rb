class MyMailer < ActionMailer::Base
  default from: 'noreply@example.com'

  def invitation_email(form_params, invite_url)
    @invitation = invitation
    @reciever_email = form_params[:reciever_email]
    @invite_url = invite_url
    mail(to: @reciever_email, subject: "You're invited to a trip!")
  end
end
