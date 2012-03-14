class Flight < ActiveRecord::Base
  belongs_to :departure_airport, :class_name => "Airport"
  belongs_to :arrival_airport, :class_name => "Airport"

  before_save :calculate_and_save_distance
  
  def calculate_and_save_distance
    # self.distance = self.departure_airport_id
    # self.distance = self.departure_airport.latitude
    departure_airport_latitude  = self.departure_airport.latitude
    departure_airport_longitude = self.departure_airport.longitude
    arrival_airport_latitude    = self.arrival_airport.latitude
    arrival_airport_longitude   = self.arrival_airport.longitude
        
    calc_distance = Haversine.distance( departure_airport_latitude, 
                                        departure_airport_longitude, 
                                        arrival_airport_latitude, 
                                        arrival_airport_longitude )
    self.distance = calc_distance.to_miles
  end

  def arrives_at
    self.departs_at + ((self.distance / 6) * 60)
  end

  def travel_time
    # have not figured out time subtraction
  end
end