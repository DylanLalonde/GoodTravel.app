# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "welcome@gootravel.com"
  layout "mailer"
end
