# frozen_string_literal: true

class Experience < ApplicationRecord
  belongs_to :host_info
  belongs_to :location
  has_many :bookings
  has_many :ngo_locations, through: :location
  # has_one :featured_ngo, class: Ngo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
