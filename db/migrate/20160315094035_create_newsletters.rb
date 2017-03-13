class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :subscribed

      t.timestamps null: false
    end
  end
end
