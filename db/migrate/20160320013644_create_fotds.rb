class CreateFotds < ActiveRecord::Migration
  def change
    create_table :fotds do |t|
      t.integer :fact_id

      t.timestamps null: false
    end
  end
end
