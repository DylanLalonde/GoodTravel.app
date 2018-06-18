class AddNameToHostInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :host_infos, :name, :string
  end
end
