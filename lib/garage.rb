require_relative 'bike_container'
require_relative 'van'


include BikeContainer

class Garage

	def initialize(options = {})
  	  self.capacity = options.fetch(:capacity, capacity)
    end
end