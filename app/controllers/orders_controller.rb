# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    booking = Booking.find(params[:booking_id])
  end
end
