class Airport < ActiveRecord::Base
  validates :city, presence: true
  validates :code, presence: true, length: { maximum: 3 }

  acts_as_gmappable

  def gmaps4rails_address
    city
  end

  # def gmaps4rails_title
  #   "Departs from #{city}"
  # end
end
