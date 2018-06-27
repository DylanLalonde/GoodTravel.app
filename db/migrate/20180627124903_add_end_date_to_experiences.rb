class AddEndDateToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :end_date, :date
  end
end
