class AddNumberTravellerToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :number_traveller, :integer
  end
end
