class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.references :host_info, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
