# frozen_string_literal: true

class Experience < ApplicationRecord
  belongs_to :host_info
  belongs_to :location
  has_many :bookings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
