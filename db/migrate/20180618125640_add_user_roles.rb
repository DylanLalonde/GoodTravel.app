class AddUserRoles < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :photo, :string
    add_column :users, :referrer_info_id, :integer
    add_column :users, :traveller_info_id, :integer
    add_column :users, :host_info_id, :integer
  end
end
