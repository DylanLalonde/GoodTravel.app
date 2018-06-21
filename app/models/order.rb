class Order < ApplicationRecord
  belongs_to :user
  t.monetize :amount, currency: { present: false }

  monetize :amount_cents

end
