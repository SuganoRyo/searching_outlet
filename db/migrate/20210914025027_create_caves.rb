class CreateCaves < ActiveRecord::Migration[6.1]
  def change
    create_table :caves do |t|
      t.string :image
      t.string :name
      t.string :address
      t.time :business_hours
      t.integer :number_seats
      t.boolean :wifi
      t.integer :user_id

      t.timestamps
    end
  end
end
