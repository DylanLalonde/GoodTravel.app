# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :referrer_info, optional: :true
  belongs_to :traveller_info
  belongs_to :selected_ngo, class_name: :Ngo, foreign_key: :selected_ngo
  belongs_to :experience

  monetize :amount_cents
end
