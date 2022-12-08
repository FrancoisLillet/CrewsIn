class MyMailer < ActionMailer::Base
  default from: 'crewsin@example.com'
  layout "mailer"

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

  def send_summary_pdf
    recipient = params[:recipient]
    @user = User.find(params[:user])
    @trip = Trip.find(params[:trip])
    attachments['summary.pdf'] = WickedPdf.new.pdf_from_string(
      render_to_string(template: 'trips/summary', pdf: 'summary')
    )
    mail(to: recipient, subject: 'Summary PDF', cc: @user.email) do |format|
      format.html
    end
  end

end

# def invitation_email(form_params, invite_url)

# @receiver_email = form_params[:receiver_email]
