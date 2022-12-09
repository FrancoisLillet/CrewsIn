class InvitationsController < ApplicationController
  def index
    @user = current_user
    @pending_invitations = Invitation.where(receiver_email: @user.email).select do |invitation|
      invitation.receiver_id.nil?
    end
    @invited_trips = @pending_invitations.map { |pending_invitation| pending_invitation.trip }
  end

  def create
    @user = current_user
    @invitation = Invitation.new(invitation_params)
    @invitation.sender = @user
    @trip = Trip.find(params[:trip_id])
    @invitation.trip_id = params[:trip_id]
    @invitation.save
    if @invitation.save
      MyMailer.with(invitation: @invitation).invitation_email.deliver_now
      redirect_to trip_path(@trip)
    else
      redirect_to trip_path(@trip), alert: "Your invitation was not sent because some fields were missing"
    end
  end

  def update
    @user = current_user
    @invitation = Invitation.find(params[:id])
    @invitation.receiver_id = @user.id
    @invitation.save
    redirect_to user_trips_path(@user)
  end

  def destroy
    @user = current_user
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    redirect_to user_invitations_path(@user)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:sender_id, :receiver_id, :receiver_email, :trip_id)
  end
end
