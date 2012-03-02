class Flight < ActiveRecord::Base
  belongs_to :departure_airport, :class_name => "Airport"
  belongs_to :arrival_airport, :class_name => "Airport"

  def arrives_at
    self.departs_at + ((self.distance / 6) * 60)
  end

  def travel_time
    # have not figured out time subtraction
  end
end