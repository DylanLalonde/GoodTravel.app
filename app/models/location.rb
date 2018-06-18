class Location < ApplicationRecord
  has_many :experiences
  has_many :ngo_locations
end
