class AddLocationToAirport < ActiveRecord::Migration
  def change
    add_column :airports, :latitude, :float
    add_column :airports, :longitude, :float
    add_column :airports, :gmaps, :boolean
  end
end
