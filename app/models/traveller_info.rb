# frozen_string_literal: true

class TravellerInfo < ApplicationRecord
  belongs_to :user
  has_many :bookings
end
