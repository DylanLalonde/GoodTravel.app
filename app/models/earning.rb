class Earning < ApplicationRecord
  belongs_to :booking
  belongs_to :referrer_info
  monetize   :amount_cents
end
