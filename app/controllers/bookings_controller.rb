# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :set_booking, only: [ :new, :show, :create,]

  def show
  end

  def new
    @booking = Booking.new
    @users = User.all
  end

  def create
    @booking = Booking.new(booking_params)
    @user = current_user
    @booking.user = @user
    @booking.experiences = @experiences
    @booking.amount = update_total

    if @booking.save
      redirect_to dashboard_path
    else
      render "experiences"
    end
  end

  def update_total
    total = @booking.number_travellers * @booking.experience.price
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
      params.require(:booking).permit(:user_id)
    end
end
