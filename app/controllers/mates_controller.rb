class MatesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @mates = @user.mates.select { |mate| mate.is_user == false }.sort { |m1, m2| m2.updated_at <=> m1.updated_at }
  end

  def show
    set_mate
    @user = current_user
  end

  def new
    @mate = Mate.new
    @user = current_user
  end

  def create
    redirect_page = params[:mate][:redirect_page]
    @mate = Mate.new(mate_params)
    @user = current_user
    @mate.user = current_user
    if @mate.save
      unless redirect_page == nil
          redirect_to redirect_page
      else
        if @mate.is_user
          redirect_to user_path(@user)
        else
          redirect_to user_mates_path
        end
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = current_user
    set_mate
  end

  def update
    redirect_page = params[:mate][:redirect_page]
    @user = current_user
    set_mate
    if @mate.update(mate_params)
      unless redirect_page == nil
          redirect_to redirect_page
      else
        if @mate.is_user
          redirect_to user_path(@user)
        else
          redirect_to user_mates_path
        end
      end
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
    params.require(:mate).permit(:first_name, :last_name, :is_user, :date_of_birth, :address, :nationality,
                                 :passport_number, :expiration_date, :country_of_residence)
  end
end
