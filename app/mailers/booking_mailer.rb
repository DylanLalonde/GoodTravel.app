class BookingMailer < ApplicationMailer
  def creation_confirmation(booking)
    @booking = booking

    mail(
      to:       @booking.user.email,
      subject:  "Booking #{@booking.name} created!"
    )
  end
end
