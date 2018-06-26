class AddDurationToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :duration, :integer
  end
end
