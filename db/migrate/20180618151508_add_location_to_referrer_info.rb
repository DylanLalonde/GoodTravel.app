class AddLocationToReferrerInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :referrer_infos, :location_id, :integer
    add_index :referrer_infos, :referral_code
  end
end
