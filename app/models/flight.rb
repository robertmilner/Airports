class Flight < ActiveRecord::Base

  # associations
  belongs_to :departure_airport, :class_name => "Airport"
  belongs_to :arrival_airport, :class_name => "Airport"

  # callbacks
  before_save :calculate_and_save_distance

  # methods
  def calculate_and_save_distance

    # not very scalable this way, very rigid
    # have to figure out way to interate over each airport involved
    # in a flight. still think the model association limits what we can do

    # get the departure and arrival airport's latitudes and longitudes
    departure_airport_latitude  = self.departure_airport.latitude
    departure_airport_longitude = self.departure_airport.longitude
    arrival_airport_latitude    = self.arrival_airport.latitude
    arrival_airport_longitude   = self.arrival_airport.longitude
    # calculate the distance with the Haversine gem
    calcuated_distance = Haversine.distance( departure_airport_latitude, 
                                        departure_airport_longitude, 
                                        arrival_airport_latitude, 
                                        arrival_airport_longitude )
    # convert the calcuated_distance to miles
    self.distance = calcuated_distance.to_miles
  end

  def arrives_at
    self.departs_at + ((self.distance / 6) * 60)
  end

  def travel_time
    # have not figured out time subtraction
  end
end