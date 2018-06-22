class RemoveSelectedNgoFromBookings < ActiveRecord::Migration[5.2]
  def change
     remove_column :bookings, :selected_ngo, :string
  end
end
