class EnrollmentsController < ApplicationController
  def new
    @user = current_user
    @enrollment = Enrollment.new
  end

  def create
    @user = current_user
    @enrollment = Enrollment.new(enrollment_params)
    @trip = Trip.find(params[:trip_id])
    @enrollment.trip = @trip
    @enrollment.save
    if @enrollment.save
      redirect_to trip_path(@trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user = current_user
    @enrollment = Enrollment.find(params[:id])
    @trip = @enrollment.trip
    @enrollment.destroy
    redirect_to trip_path(@trip)
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:mate_id, :trip_id)
  end
end
