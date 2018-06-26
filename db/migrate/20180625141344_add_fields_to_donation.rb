class AddFieldsToDonation < ActiveRecord::Migration[5.2]
  def change
    add_column :donations, :booking_id, :integer
    add_column :donations, :ngo_id, :integer
    add_monetize :donations, :amount, currency: { present: false }
  end
end
