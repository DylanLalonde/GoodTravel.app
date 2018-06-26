# frozen_string_literal: true

class PaymentsController < ApplicationController
  before_action :set_order
  skip_after_action :verify_authorized

  def new
    @experience = Experience.find(params[:experience_id])
    @booking = Booking.find(params[:booking_id])
    @order = Order.find(params[:order_id])
  end

  def create
    @experience = Experience.find(params[:experience_id])
    @booking = Booking.find(params[:booking_id])
    @order = Order.find(params[:order_id])
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
      )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @order.amount_cents,
      description:  "Payment for booking experience #{@order.booking_sku} for order #{@order.id}",
      currency:     @order.amount.currency
    )

    @order.update(payment: charge.to_json, state: "paid")
    redirect_to experience_booking_path(@experience, @booking)

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_experience_booking_order_payment_path(@experience, @booking, @order)
  end

  # def show
  #   @order = current_user.orders.where(state: "paid").find(params[:id])
  # end

  private

    def set_order
      @order = current_user.orders.where(state: "pending").find(params[:order_id])
    end
end
