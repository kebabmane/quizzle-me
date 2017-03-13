class FactOfTheDay < ActiveRecord::Migration
  create_table :fact_of_the_day do |t|
    t.string :fact_id
    t.timestamps
  end
end
