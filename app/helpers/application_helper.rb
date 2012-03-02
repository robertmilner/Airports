module ApplicationHelper
  def format_time(t)
    t.strftime("%I:%M %p")
  end
  
  def travel_time(t)
    t.strftime("%I:%M")
  end
end
