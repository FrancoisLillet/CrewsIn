class TripsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @trips = @user.created_trips
    @all_trips = []
    # Add all the trips where the user was invited by someone else.
    @user.invitations_received.each do |invitation|
        @all_trips << invitation.trip
    end
    @all_trips = @trips + @all_trips
    @upcoming_trips = @all_trips.select { |trip| trip.start_date >= Date.today }
    @past_trips = @all_trips.select { |trip| trip.start_date < Date.today }
  end
end
