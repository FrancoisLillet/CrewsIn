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


private

def user_params
  params.require(:user).permit(:photo, :nickname)
end

end
