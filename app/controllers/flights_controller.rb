class FlightsController < ApplicationController

  respond_to :json, :html

  def index
    @flights = Flight.order('number ASC')

    respond_with @flights
  end

  def show
    @flight = Flight.find(params[:id]) 
    # call departure_airport and arrival_airport model associations on a flight 
    # object and require only the latitude and longitude as JSON objects
    departs = @flight.departure_airport.as_json(:only => [:latitude, :longitude])
    arrives = @flight.arrival_airport.as_json(:only => [:latitude, :longitude])
    # create an array of the two objects departs and arrives
    airports = [ departs, arrives ]
    # map the latitude JSON object to lat and longitude to lng and resave
    # airports variable with new key => value pairings
    airports = airports.map do |marker|
      { lng: marker['longitude'], :lat => marker['latitude'] }
    end
    # place array into another array to create a JSON object for Google Maps because
    # .to_gmaps4rails fails with a "undefined method 'gmaps4rails_options'"
    map = [ airports ]
    @map = map.to_json

    # @map = '[ [ {"lng": 0, "lat": 0}, {"lng": 15, "lat": 10} ] ]'

    respond_with @flight
  end
end