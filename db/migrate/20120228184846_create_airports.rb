class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :city
      t.string :code

      t.timestamps
    end
    
    add_index :airports, :city
    add_index :airports, :code
  end
end
