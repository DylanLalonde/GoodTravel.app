class AddAmountDonatedToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :amount_donated, :float
  end
end
