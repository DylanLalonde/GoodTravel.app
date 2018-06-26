# frozen_string_literal: true

class ReferrerInfo < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :earnings
end
