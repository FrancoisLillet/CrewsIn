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
    set_trip
    @invited_users = Invitation.where("trip_id = ? AND receiver_id IS NOT null", @trip.id).pluck(:receiver_id)
    @enrollment = Enrollment.new
    @user = current_user
    @invitation = Invitation.new
  end

  def new
    @trip = Trip.new
    @user = current_user
  end

  def create
    @trip = Trip.new(trip_params)
    @user = current_user
    @trip.creator_id = @user.id
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

  def destroy
    @user = current_user
    set_trip
    @trip.destroy
    redirect_to user_trips_path(@user)
  end

  def summary
    @trip = Trip.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "summary"
      end
    end
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:country, :start_date, :end_date, :starting_point, :max_capacity, :creator_id, :skipper_id, :photo)
  end
end
