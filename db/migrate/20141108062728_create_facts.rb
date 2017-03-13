class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :fact_string

      t.timestamps
    end
  end
end
