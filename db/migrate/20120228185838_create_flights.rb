class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :departure_airport_id
      t.integer :arrival_airport_id
      t.string :number
      t.time :departs_at
      t.integer :distance

      t.timestamps
    end
    
    add_index :flights, :departure_airport_id
    add_index :flights, :arrival_airport_id
    add_index :flights, :number
    add_index :flights, :departs_at
    add_index :flights, :distance
  end
end
