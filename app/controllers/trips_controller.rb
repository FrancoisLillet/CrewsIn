class TripsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @trips = @user.created_trips + @user.invitations_received
    @upcoming_trips = @trips.select { |trip| trip.start_date >= Date.today }
    @past_trip = @trips.select { |trip| trip.start_date > Date.today }
  end
end
