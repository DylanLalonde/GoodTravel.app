class CreateTravellerInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :traveller_infos do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
