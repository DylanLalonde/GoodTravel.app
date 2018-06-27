# frozen_string_literal: true

class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  skip_after_action :verify_authorized
  # before_action :set_booking, only: [:new, :create]

  def show
    @user = current_user
    @experience = Experience.find(params[:experience_id])
    @booking = Booking.find(params[:id])
    @totaldonations = Money.new(@booking.ngo.donations.sum(:amount_cents))
    @referrerearnings = Money.new(@booking.referrer_info.earnings.sum(:amount_cents))
    @referrerearning = Money.new(@booking.earning.amount)
  end

  def new
    @experience = Experience.find(params[:experience_id])
    @booking = Booking.new
    @users = User.all
    @ngos = Ngo.all
    authorize @booking
  end

  def create
    ngo = Ngo.find(params[:booking][:ngo_id])
    @experience = Experience.find(params[:experience_id])
    @booking = Booking.new(booking_params)
    @booking.ngo = ngo
    @booking.experience = @experience
    @traveller_info = TravellerInfo.create(user: current_user)
    @booking.traveller_info = @traveller_info
    @booking.amount = update_total
    @donationamount = @booking.amount * 0.05 # Using donationamount for donation amount & referrer earnings!
    ### Temporary fix: picking last referrer. Seed needs same for now:
    @referrer = ReferrerInfo.last
    @booking.referrer_info = @referrer
    authorize @booking

    if @booking.save!

      @order = Order.create!(booking_sku: @booking.id, amount: @booking.amount, state: "pending", user: current_user)
      # @donation = Donation.create!(booking: @booking, ngo: ngo, amount: @donationamount )
      # @earning = Earning.create!(booking: @booking, referrer_info: @booking.referrer_info, amount: @donationamount )
      # change booking_sku in the order model to booking_id
      # add an order_id to booking
      # redirect_to experience_booking_path(@experience, @booking)
      redirect_to new_experience_booking_order_payment_path(@experience, @booking, @order)

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

    # def set_booking
    #   @booking = Booking.find(params[:experience_id])
    #   authorize @booking
    # end

    def booking_params
      params.require(:booking).permit(:user_id, :amount, :referrer_info_id, :traveller_info_id, :ngo_id, :number_traveller, :start_date, :end_date, :description, :amount_donated)
    end
end
