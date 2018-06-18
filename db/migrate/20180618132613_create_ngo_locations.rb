class CreateNgoLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :ngo_locations do |t|
      t.references :ngo, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
