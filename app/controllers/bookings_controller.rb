# frozen_string_literal: true

class BookingsController < ApplicationController
skip_before_action :authenticate_user!, only: [:show]
  before_action :set_booking, only: [:new, :create]

  def show
     @user = current_user
     @experience = Experience.find(params[:experience_id])
     @booking = Booking.find(params[:id])
  end

  def new
    @experience = Experience.find(params[:experience_id])
    @booking = Booking.new
    @users = User.all
    @ngos = Ngo.all
  end

  def create
    @booking = Booking.new(booking_params)
    @traveller_info = TravellerInfo.create(user: current_user)
    @booking.traveller_info = @traveller_info
    raise
    @booking.amount = update_total
   
    if @booking.save
      redirect_to experience_booking_path
    else
      render "experiences"
    end
  end

  def update_total
    total = @booking.number_traveller * @experience.price
  end


  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  private

    def set_booking
      @experience = Experience.find(params[:experience_id])
    end
    def booking_params
      params.require(:booking).permit(:user_id, :amount, :referrer_info_id, :traveller_info_id, :ngo_id,)
    end
end
    