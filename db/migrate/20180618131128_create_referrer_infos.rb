class CreateReferrerInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :referrer_infos do |t|
      t.integer :referral_code
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
