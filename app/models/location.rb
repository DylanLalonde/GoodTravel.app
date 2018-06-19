# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :experiences
  has_many :ngo_locations
  has_many :ngos, through: :ngo_locations
end
