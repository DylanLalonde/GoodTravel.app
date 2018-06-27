# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user

    mail(to: user.email, subject: "Welcome to Good Travel")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.booking_confirmation.subject
  #
  def booking_confirmation(user)
    @user = user
    # @greeting = "Hi"

    mail(to: user.email, subject: "Thanks for booking with Good Travel")
  end
end
