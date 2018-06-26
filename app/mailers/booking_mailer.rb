class BookingMailer < ApplicationMailer
  def creation_confirmation(booking)
    @booking = booking

    mail(to:user.email, subject:"Booking #{@booking.name} created!")

  end
end
