# frozen_string_literal: true

class Donation < ApplicationRecord
  belongs_to :booking
  belongs_to :ngo
  monetize   :amount_cents
end
