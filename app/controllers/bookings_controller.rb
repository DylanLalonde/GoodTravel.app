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
    ngo = Ngo.find(params[:booking][:ngo_id])
    experience = Experience.find(params[:experience_id])

    @booking = Booking.new(booking_params)
    @booking.ngo = ngo
    @booking.experience = experience
    @traveller_info = TravellerInfo.create(user: current_user)
    @booking.traveller_info = @traveller_info
    @booking.amount_cents = update_total

    if @booking.save!
        @order = Order.create!(booking_sku: @booking.id, amount_cents: @booking.amount_cents, state: "pending", user: current_user)
        # change booking_sku in the order model to booking_id
        # add an order_id to booking
        redirect_to new_experience_booking_order_payment_path(experience, @booking, @order)
        # redirect_to experience_booking_path(@experience, @booking)
    else
      @experience = Experience.find(params[:experience_id])
      @ngos = Ngo.all
      @users = User.all
      render :new
    end
  end




  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  private

    def update_total
      total = @booking.number_traveller * @experience.price
    end

    def set_booking
      @experience = Experience.find(params[:experience_id])
    end

    def booking_params
      params.require(:booking).permit(:user_id, :amount_cents, :referrer_info_id, :traveller_info_id, :ngo_id, :number_traveller, :start_date, :end_date, :description)
    end
end
