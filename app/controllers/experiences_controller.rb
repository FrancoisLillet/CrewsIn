class ExperiencesController < ApplicationController
  def new
    @experience = Experience.new
  end

  def create
    @user = current_user
    @experience = Experience.new(experience_params)
    @experience.user = @user
    @experience.save
    if @experience.save
      redirect_to user_nautical_cv_path
    else
      redirect_to user_path(@user)
    end
  end

  def update
    @user = current_user
    @experience = Experience.find(params[:id])
    @experience.update(experience_params)
    if @experience.update(experience_params)
      redirect_to user_nautical_cv_path
    else
      redirect_to user_path(@user)
    end
  end

  def destroy
    @user = current_user
    @experience = Experience.find(params[:id])
    @experience.destroy
    redirect_to user_nautical_cv_path(@user)
  end

  private

  def experience_params
    params.require(:experience).permit(:country, :sailing_area, :start_date, :end_date, :role, :boat_model,
     :boat_length, :boat_type, :boat_owner, :number_of_miles, :comment)
  end
end
