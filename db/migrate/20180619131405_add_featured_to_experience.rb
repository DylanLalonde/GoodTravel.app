class AddFeaturedToExperience < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :featured_ngo, :integer
  end
end
