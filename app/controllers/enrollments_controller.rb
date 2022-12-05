class EnrollmentsController < ApplicationController
  def new
    @user = current_user
    @enrollment = Enrollment.new
  end

  def create
    @user = current_user
    # @mate = set_mate
    # @trip = set_trip
    @enrollment = Enrollment.new(enrollment_params)
    @enrollment.mate_id = set_mate.id
    @enrollment.trip_id = set_trip.id
    @enrollment.save
    if enrollment.save
      redirect_to trip_path(@trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user = current_user
    @enrollment = Enrollment.find(params[:id])
    @enrollment.destroy
    redirect_to trip_path(@trip)
  end

  private

  def set_mate
    @mate = Mate.find(params[:id])
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def enrollment_params
    params.require(:enrollment).permit(:mate_id, :trip_id)
  end
end
