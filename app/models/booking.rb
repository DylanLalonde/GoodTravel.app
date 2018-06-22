# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :referrer_info, optional: :true
  belongs_to :traveller_info
  belongs_to :ngo
  belongs_to :experience

  monetize :amount_cents
end

# generate migration that changes selected ngo to integer and add _id
