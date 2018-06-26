class BookingMailer < ApplicationMailer
  def creation_confirmation(booking, user)
    @booking = booking

    mail(to:user.email, subject:"Thanks for booking with Good Travel")

  end
end
