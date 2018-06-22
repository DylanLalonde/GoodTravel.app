class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :status
      t.integer :amount_cents
      t.references :referrer_info, foreign_key: true
      t.references :traveller_info, foreign_key: true
      t.references :ngo, foreign_key: true
      t.references :experience, foreign_key: true

      t.timestamps
    end
  end
end
