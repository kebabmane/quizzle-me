class AddUpDowntoFacts < ActiveRecord::Migration
  def change
  	add_column :facts, :thumbs_up, :int, :default => 0, :null => false
  	add_column :facts, :thumbs_down, :int, :default => 0, :null => false
  end
end
