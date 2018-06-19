class AddCategoryToNgos < ActiveRecord::Migration[5.2]
  def change
    add_column :ngos, :category, :string
  end
end
