class TripsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current.user
    @trips = @user.created_trips + @user.invitations_received
    raise
  end
end
