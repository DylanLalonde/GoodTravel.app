# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    booking = Booking.find(params[:booking_id])
    order = Order.create!(booking_sku: booking.sku, amount: booking.price, state: "pending", user: current_user)

    redirect_to new_order_payment_path(order)
  end
end
