class RemovePriceFromExperience < ActiveRecord::Migration[5.2]
  def change
    remove_column :experiences, :price, :integer
  end
end
