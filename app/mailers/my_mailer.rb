class MyMailer < ActionMailer::Base
  default from: 'crewsin@example.com'

  def invitation_email
    @invitation = params[:invitation]
    mail(to: @invitation.receiver_email, subject: "You're invited to a trip!")
  end
end


# def invitation_email(form_params, invite_url)

# @receiver_email = form_params[:receiver_email]
