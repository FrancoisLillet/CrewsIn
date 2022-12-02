class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @user_as_mate = @user.mates.where("mates.is_user = true").first

  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def nautical_cv
    @user = current_user
    @experiences = current_user.experiences
  end


private

def user_params
  params.require(:user).permit(:photo)
end

end
