class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @user_as_mate = @user.mates.where("mates.is_user = true").first
  end

  def update
    redirect_page = params[:user][:redirect_page]
    @user = User.find(params[:id])
    @user.update(user_params)
    unless redirect_page == nil
      redirect_to redirect_page
    else
      redirect_to user_nautical_cv_path(@user)
    end
  end

  def nautical_cv
    @user = current_user
    @experiences = current_user.experiences.sort { |exp1, exp2| exp2.start_date <=> exp1.start_date }
    @experience = Experience.new
  end

  private

  def user_params
    params.require(:user).permit(
      :photo, :nautical_bio, :license_recto, :license_verso,
      :vhf_certificate, :passport_photo
    )
  end
end
