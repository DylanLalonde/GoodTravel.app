class AddSelectedNgoToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :selected_ngo, :string
  end
end
