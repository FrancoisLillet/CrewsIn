class MyMailer < ActionMailer::Base
  default from: 'crewsin@example.com'

  def invitation_email
    @invitation = params[:invitation]
    @user = params[:user]
    @invited_user = User.where(email: @invitation.receiver_email).first
    if @invited_user == nil
      @target_url = url_for(controller: 'pages', action: 'landing')
    else
      @target_url = url_for(controller: 'invitations', action: 'index', user_id: @invited_user.id)
    end
    mail(to: @invitation.receiver_email, subject: "You're invited to a trip!")
  end

  def send_summary_pdf(recipient)
    @user = params[:user]
    attachments['summary.pdf']
    mail(to: recipient, subject: 'Summary PDF', cc: @user.email)
  end
end




# def invitation_email(form_params, invite_url)

# @receiver_email = form_params[:receiver_email]
