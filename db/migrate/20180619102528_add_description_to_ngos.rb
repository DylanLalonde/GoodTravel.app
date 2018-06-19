class AddDescriptionToNgos < ActiveRecord::Migration[5.2]
  def change
    add_column :ngos, :description, :string
  end
end
