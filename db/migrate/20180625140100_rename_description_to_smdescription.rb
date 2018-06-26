class RenameDescriptionToSmdescription < ActiveRecord::Migration[5.2]
  def change
     rename_column :experiences, :description, :smdescription
  end
end
