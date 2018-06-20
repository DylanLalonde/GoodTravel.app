# frozen_string_literal: true

class Ngo < ApplicationRecord
  has_many :ngo_locations
  has_many :locations, through: :ngo_locations
  has_many :bookings
end