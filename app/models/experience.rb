# frozen_string_literal: true

class Experience < ApplicationRecord
  belongs_to :host_info
  belongs_to :location
  has_many :bookings
  has_many :ngo_locations, through: :location
end
