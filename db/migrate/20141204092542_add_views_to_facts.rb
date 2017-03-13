class AddViewsToFacts < ActiveRecord::Migration
  def change
  	add_column :facts, :views, :int
  end
end
