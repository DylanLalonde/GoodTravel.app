class AddFieldsToEarnings < ActiveRecord::Migration[5.2]
  def change
    add_column :earnings, :booking_id, :integer
    add_column :earnings, :referrer_info_id, :integer
    add_monetize :earnings, :amount, currency: { present: false }
  end
end
