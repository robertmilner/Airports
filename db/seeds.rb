# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Airport.destroy_all

Airport.create city: 'Chicago', code: 'ORD'
Airport.create city: 'San Francisco', code: 'LAX'
Airport.create city: 'New York', code: 'JFK'
Airport.create city: 'Frankfurt', code: 'FRA'

puts "We now have #{Airport.count} airports."

Flight.destroy_all

all_airports = Airport.all

60.times do
  
  airports = all_airports.shuffle
  
  flight = Flight.new
  flight.number = rand(999-101) + 101 
  flight.departure_airport = airports.first
  flight.departs_at = Time.parse("#{rand(23-0)}:00")
  flight.arrival_airport = airports.last
  # # distance is now calculated in the Model class
  # flight.distance = rand(3000-700) + 700
  flight.save
end

puts "We now have #{Flight.count} flights."