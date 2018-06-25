class ChangeAmountInBookings < ActiveRecord::Migration[5.2]
  def change
    # remove_column :bookings, :amount
    add_monetize :bookings, :amount, currency: { present: false }
  end
end
