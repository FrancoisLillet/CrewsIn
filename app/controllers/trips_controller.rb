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

  def show
    @user = current_user
    set_trip
  end

  def new
    @trip = Trip.new
    @user = current_user
  end

  def create
    @trip = Trip.new(trip_params)
    @user = current_user
    @trip.creator_id = @user.id
    @trip.skipper_id = @user.id
    if @trip.save
      redirect_to user_trips_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = current_user
    set_trip
  end

  def update
    @user = current_user
    set_trip
    if @trip.update(trip_params)
      redirect_to user_trips_path(@user)
    else
      render :edit
    end
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:country, :start_date, :end_date, :starting_point, :max_capacity, :creator_id, :skipper_id)
  end
end
