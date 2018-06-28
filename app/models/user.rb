# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :referrer_infos
  has_many :traveller_infos
  has_many :host_infos
  has_many :bookings
  has_many :orders

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  after_create :send_welcome_email

  private

    def send_welcome_email
      UserMailer.welcome(self).deliver_now
    rescue => e
      Rails.logger.error("User#send_welcome_email error: #{e.message}")
    end
end
