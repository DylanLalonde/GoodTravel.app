class Experience < ApplicationRecord
  belongs_to :host_info
  belongs_to :location
  has_many :bookings
end
