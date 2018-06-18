class AddDescriptionToHostInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :host_infos, :description, :string
  end
end
