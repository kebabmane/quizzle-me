class UpdateDevices < ActiveRecord::Migration
  def change
    change_table :devices, id: :uuid  do |t|
      t.string :registration_id
    end
    add_index :devices, :registration_id
  end
end
