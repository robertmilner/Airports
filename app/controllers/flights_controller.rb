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
  
  def new
    @flight = Flight.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @flight }
    end
  end
  
  def edit
    @flight = Flight.find(params[:id])
  end

  def create
    @flight = Flight.new(params[:flight])

    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, notice: 'User was successfully created.' }
        format.json { render json: @flight, status: :created, location: @flight }
      else
        format.html { render action: "new" }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @flight = Flight.find(params[:id])

    respond_to do |format|
      if @flight.update_attributes(params[:flight])
        format.html { redirect_to @flight, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @flight = Flight.find(params[:id])
    @flight.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  
end