class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :device_id
      t.integer	 :device_guid
      t.string :device_os
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
