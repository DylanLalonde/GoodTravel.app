class RemoveStartTimeToExperiences < ActiveRecord::Migration[5.2]
  def change
    remove_column :experiences, :start_time
    add_column :experiences, :start_time, :time
  end
end
