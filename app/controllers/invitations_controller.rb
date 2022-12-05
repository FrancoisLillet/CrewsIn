class InvitationsController < ApplicationController
  def create
    @user = current_user
    @invitation = Invitation.new(invitation_params)
    @invitation.sender = @user
    @invitation.trip_id = params[:trip_id]
    @invitation.save
    if @invitation.save
      MyMailer.with(invitation: @invitation).invitation_email.deliver_now
      redirect_to user_trips_path
    else
      redirect_to user_trips_path, alert: "Your invitation was not sent because some fields were missing"
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:sender_id, :receiver_id, :receiver_email, :trip_id)
  end

end
