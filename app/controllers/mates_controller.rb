class MatesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @mates = Mate.all
  end

  def show
    @user = current_user
    set_mate
  end

  def new
    @mate = Mate.new
    @user = current_user
  end

  def create
    @mate = Mate.new(mate_params)
    @user = current_user
    @mate.user = current_user
    if @mate.save
      redirect_to user_mates_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = current_user
    set_mate
  end

  def update
    @user = current_user
    set_mate
    if @mate.update(mate_params)
      redirect_to user_mates_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    set_mate
    @mate.destroy
    redirect_to user_mates_path(@user)
  end

  private

  def set_mate
    @mate = Mate.find(params[:id])
  end

  def mate_params
    params.require(:mate).permit(:first_name, :last_name, :date_of_birth, :address, :nationality, :passport_number, :expiration_date)
  end
end
