class AddDataToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :osVersion, :string
    add_column :devices, :device_time_zone, :datetime
    add_column :devices, :sdkVersion, :string
    add_column :devices, :device_name, :string
  end
end
