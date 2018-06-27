class AddStartTimeToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :start_time, :datetime
  end
end
