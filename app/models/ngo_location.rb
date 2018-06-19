# frozen_string_literal: true

class NgoLocation < ApplicationRecord
  belongs_to :ngo
  belongs_to :location
end
