class ChangeFactView < ActiveRecord::Migration
  def up
  	add_column :facts, :displayed, :boolean, :default => true, :null => false
  end
end
