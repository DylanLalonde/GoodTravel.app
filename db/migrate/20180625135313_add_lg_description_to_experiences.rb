class AddLgDescriptionToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :lgdescription, :string
  end
end
