# frozen_string_literal: true

class Booking < ApplicationRecord
  # in future we will use new 'earnings' table and use belongs_to :referrer_info, through: :earnings    !!!!!
  belongs_to :referrer_info, optional: :true # !!! Need to remove this optional, true! should not be optional!
  belongs_to :traveller_info
  belongs_to :ngo
  belongs_to :experience
  has_one    :donation
  has_one    :earning
  monetize   :amount_cents

  # after_save :createdonation
  # after_save :createearning ## Now handled in payment controller create action

  ### Instantiates a new (ngo) donation and (referrer) earning every time a booking is created:
  def createdonation
    Donation.create!(booking_id: self.id, ngo_id: self.ngo_id, amount_cents: self.amount_cents * 0.05)
  end

  def createearning
    Earning.create!(booking_id: self.id, referrer_info_id: ReferrerInfo.last.id, amount_cents: self.amount_cents * 0.05 )
  end
end
